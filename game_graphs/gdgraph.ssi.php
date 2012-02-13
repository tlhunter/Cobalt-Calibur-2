<?php

/***********************************************************************************
* Software: GDGraph                                                                *
* Version:  1.0.1                                                                  *
* Date:     2005-10-19                                                             *
* Author:   Makko Solutions                                                        *
* Contact:  gdgraph@makko.com.mx                                                   *
* License:  GPL License (see below)                                                *
* Desription: Create line, pie and bar graphs with PHP and GD installed.           *
***********************************************************************************/

/***********************************************************************************
* Copyright (C) 2005  Makko Solutions                                              *
*                                                                                  *
* This program is free software; you can redistribute it and/or                    *
* modify it under the terms of the GNU General Public License                      *
* as published by the Free Software Foundation; either version 2                   *
* of the License, or (at your option) any later version.                           *
*                                                                                  *
* This program is distributed in the hope that it will be useful,                  *
* but WITHOUT ANY WARRANTY; without even the implied warranty of                   *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                    *
* GNU General Public License for more details.                                     *
*                                                                                  *
* You should have received a copy of the GNU General Public License                *
* along with this program; if not, write to the Free Software                      *
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.  *
***********************************************************************************/

/*
	This software needs GD to be installed into PHP.
	Preferably the one bundled in, if it’s PHP 4.3.0 or higher,
	since that’s the one that it was made and tested with.
*/

/*

Corrections from 1.0.0:
	-	Fixed a neverending cycle when entering data arrays all with 0 values.
	-	X Axis title switched to be printed below the X Axis.
	-	Rounding error made the last value negative (in degrees) of pie data array.

*/

if(!class_exists('GDGRAPH')){
define('GDGRAPH_VERSION','1.0.1');
class GDGraph{
	//Protected properties
	var $image;					//actual image
	var $width;					//width of whole image
	var $height;				//height of whole image
	var $line_color;			//color of surrounding lines
	var $title;					//title of graph
	var $bg_color;				//background color
	var $left_border;			//distance from left border
	var $right_border;			//distance from right border
	var $top_border;			//distance from top border
	var $bottom_border;			//distance from bottom border
	var $font_color;			//font color
	var $legend;				//if it’s going to include a legend
	var $legend_x;				//x position of legend
	var $legend_y;				//y position of legend

	var $font_number;

	
	/****************** Public methods *******************/

	//Constructor.
	//	Defaults:
	//		With legend, no titles, white background, black lines and black font.
	function GDGraph($w, $h, $t="", $bg_c_r=255, $bg_c_g=255, $bg_c_b=255, $l_c_r=0, $l_c_g=0, $l_c_b=0, $str_c_r=0, $str_c_g=0, $str_c_b=0, $l=true,$l_x=NULL,$l_y=NULL){
		$this->width = $w+0;
		$this->height = $h+0;
		
		#$this->font_number = imageloadfont("./includes_realtor/04b08.gbf");
		
		
		if ($this->width <= 0 || $this->height <= 0){
			die("GDGraph Error: Width nor height can be smaller or equal to 0.");
		}
		
		$this->image = imagecreate($this->width, $this->height);
		$this->line_color = imagecolorallocate($this->image, ($l_c_r+0), ($l_c_g+0), ($l_c_b+0));
		$this->bg_color = imagecolorallocate($this->image, ($bg_c_r+0), ($bg_c_g+0), ($bg_c_b+0));
		$this->font_color = imagecolorallocate($this->image, ($str_c_r+0), ($str_c_g+0), ($str_c_b+0));
		$this->title = $t."";
		$this->left_border = ceil($this->width * 0.05);
		$this->right_border = $this->width - $this->left_border;
		$this->top_border = ceil($this->height * 0.06);
		$this->bottom_border = $this->height - $this->top_border;

		$this->legend = ($l && true);
		$this->legend_x = is_null($l_x) ? $this->right_border : $l_x;
		$this->legend_y = is_null($l_y) ? $this->top_border : $l_y;

		//Activate background color
		imagefill($this->image, 0 ,0, $this->bg_color);
	}

	//Line Graph.
	//	Arrays format:
	//		Data Array:
	//			Name of line => (value in t1, value in t2, value in t3 ...)
	//		Color Array:
	//			Name of line => (red, green, blue)
	//		X Axis Labels Array:
	//			t1, t2, t3 ...
	//	Defaults:
	//		Black lines and no labels
	function line_graph($data, $color=Array(), $x_ls=Array(), $x_t="", $y_t=""){
		//Reversing the array that contains the x axis labels
		$x_label = array_reverse($x_ls);

		//Obtain Y axis length in data value without extra bottom nor top
		$specs = $this->_get_specs($data,"line");

		$y_axis_slength = 0;
		if (($specs['max_value'] == 0) && ($specs['min_value'] == 0)){
			$y_axis_length = 10;
		}else{
			if ($specs['max_value'] > 0){
				$y_axis_length = ceil($specs["max_value"]*10)/10;
				if ($specs['min_value'] < 0){
					$y_axis_length -= floor($specs['min_value']*10)/10;
					$y_axis_slength = -(floor($specs['min_value']*10)/10);
				}
			}else{
				$y_axis_length = abs(floor($specs["min_value"]*10)/10);
				$y_axis_slength = $y_axis_length;
				$all_down = true;
			}
		}

		//Obtaining Y axis division length in data value
		$y_dig = 0;
		$y_division_value = $y_axis_length;
		if ($y_axis_length < 1){
			while ($y_division_value < 1){
				$y_dig--;
				$y_division_value *= 10;
			}
		}else {
			while ($y_division_value >= 10){
				$y_dig++;
				$y_division_value /= 10;
			}
			$y_dig--;
		}
		$y_division_value = floor($y_division_value) * pow(10,$y_dig);
		$x_axis_count = floor(($y_axis_length - $y_axis_slength)/$y_division_value);

		//Adding the extra bottom and top to the Y axis length
		$y_axis_length += 2*$y_division_value;
		$y_axis_slength += $y_division_value;

		//Painting the Y axis:
		$y_axis_x = $this->width*.15;
		$y_axis_top = $this->top_border;
		$y_axis_bottom = $this->bottom_border;
		imageline($this->image, $y_axis_x, $y_axis_top, $y_axis_x, $y_axis_bottom, $this->line_color);

		//Painting the divisions
		$conversion_factor = ($y_axis_bottom - $y_axis_top)/$y_axis_length;
		$y_division_mid = $y_division_value * ($y_axis_bottom - $y_axis_top)/$y_axis_length;

		$max_y_value = ($y_axis_length - $y_axis_slength) - (($y_axis_length - $y_axis_slength)%$y_division_value);


		$y_division_left = $y_axis_x-5;
		$y_division_right = $y_axis_x+5;

		$current_y_pos = $y_axis_top + $y_division_mid;
		$current_y_value = $max_y_value;
		
		$line_count = 0;
		while($current_y_pos <= $y_axis_bottom){
			$font_left_space = strlen($current_y_value."")*5;
			imagestring($this->image, 1, $y_division_left-$font_left_space, $current_y_pos-4, $current_y_value."", $this->font_color);
			imageline($this->image, $y_division_left, $current_y_pos, $y_division_right, $current_y_pos, $this->line_color);
			$current_y_pos += $y_division_mid;
 			if($line_count == $x_axis_count){
				$x_axis_y = $current_y_pos;
	 			$current_y_value = 0;		//to avoid PHP putting something like "1628E-90" instead of 0
			}else{
	 			$current_y_value -= $y_division_value;
			}
			$line_count++;
		}

		//Painting X axis
		if (!($x_axis_y)){
			if($all_down){
				$x_axis_y = $y_axis_top;
			}else{
				$x_axis_y = $y_axis_bottom;
			}
		}
		$x_axis_left = $y_division_right;
		$x_axis_right = $this->right_border;
		imageline($this->image, $x_axis_left, $x_axis_y, $x_axis_right, $x_axis_y, $this->line_color);
		$x_axis_left = $y_division_right+10;

		//Painting each line
		$x_division_width = ($x_axis_right - $x_axis_left)/($specs['length']-1);
		foreach($data as $prod => $sub_data){
			$currentline_color = imagecolorallocate($this->image, ($color[$prod][0]+0), ($color[$prod][1]+0), ($color[$prod][2]+0));
			$current_x_pos = $x_axis_left;
			$past_x = -1;
			$past_y = -1;
			foreach($sub_data as $i => $value){
				$currentpoint_rel_height = $value * $conversion_factor;
				$currentpoint_real_height = $x_axis_y - $currentpoint_rel_height;
				imagefilledrectangle($this->image, $current_x_pos-2, $currentpoint_real_height-2, $current_x_pos+2, $currentpoint_real_height+2, $currentline_color);
				if ($past_x != -1){
					imageline($this->image, $past_x, $past_y, $current_x_pos, $currentpoint_real_height, $currentline_color);
				}
				if(strcmp($specs['ref_length'],$prod)==0){
					imageline($this->image, $current_x_pos, $x_axis_y+5, $current_x_pos, $x_axis_y-5, $this->line_color);
					
					//Printing X axis label
					$label = array_pop($x_label);
					$font_left_space = strlen($label."")*5/2;
					imagestring($this->image, 1, $current_x_pos-$font_left_space, $x_axis_y+1, $label."", $this->font_color);
				}
				$past_x = $current_x_pos;
				$past_y = $currentpoint_real_height;
				$current_x_pos += $x_division_width;
			}
		}

		//Printing Title
		$font_left_space = (strlen($this->title)*7)/2;
		imagestring($this->image, 3, ($this->width/2)-($font_left_space), 0, $this->title, $this->font_color);
		
		//Printing Y Axis Title
		imagestring($this->image, 2, $this->left_border*.5, $this->top_border*.25, $y_t."", $this->font_color);

		//Printing X Axis Title
		$font_left_space = strlen($x_t."")*6;
		imagestring($this->image, 2, $this->width-$font_left_space, $x_axis_y-12, $x_t."", $this->font_color);

		//Legend
		if($this->legend){
			if (count($color)>0)
				$this->_do_legend($color);
			else{
				$key = array_keys($data);
				foreach($key as $key => $value){
					$color[$value] = Array(0,0,0);
				}
				$this->_do_legend($color);
			}
		}

		//Return image
		header('Content-type: image/png');
		imagepng($this->image);
		imagedestroy($this->image);
	}

	//Bar Graph.
	//	Array format:
	//		Name of bar=> (value of bar, red, green, blue)
	//	Defaults:
	//		Bar width/Region width = 80%
	//		Black color
	function bar_graph($data, $x_t="", $y_t="", $wi_p=80){
		//Obtaining Y axis length in data value without extra bottom nor top
		$specs = $this->_get_specs($data,"bar");

		if (($specs['max_value'] == 0) && ($specs['min_value'] == 0)){
			$y_axis_length = 10;
			$y_axis_slength = 0;
		}else{
			if ($specs['max_value'] > 0){
				$y_axis_length = ceil($specs["max_value"]*10)/10;
				if ($specs['min_value'] < 0){
					$y_axis_length -= floor($specs['min_value']*10)/10;
					$y_axis_slength = -(floor($specs['min_value']*10)/10);
				}
			}else{
				$y_axis_length = abs(floor($specs["min_value"]*10)/10);
				$y_axis_slength = $y_axis_length;
				$all_down = true;
			}
		}
	
		//Obtaining Y axis division length in data value
		$y_dig = 0;
		$y_division_value = $y_axis_length;
		if ($y_axis_length < 1){
			while ($y_division_value < 1){
				$y_dig--;
				$y_division_value *= 10;
			}
		}else {
			while ($y_division_value >= 10){
				$y_dig++;
				$y_division_value /= 10;
			}
			$y_dig--;
		}
		$y_division_value = floor($y_division_value) * pow(10,$y_dig);
		$x_axis_count = floor(($y_axis_length - $y_axis_slength)/$y_division_value);


		//Adding the extra bottom and top to the Y axis length
		$y_axis_length += 2*$y_division_value;
		$y_axis_slength += $y_division_value;

		//Painting the Y axis:
		$y_axis_x = $this->width*.075; #this is the guy messing with the left margin
		$y_axis_top = $this->top_border;
		$y_axis_bottom = $this->bottom_border;
		imageline($this->image, $y_axis_x, $y_axis_top, $y_axis_x, $y_axis_bottom, $this->line_color);

		//Painting the divisions
		$conversion_factor = ($y_axis_bottom - $y_axis_top)/$y_axis_length;
		$y_division_mid = $y_division_value * ($y_axis_bottom - $y_axis_top)/$y_axis_length;
		$max_y_value = ($y_axis_length - $y_axis_slength) - (($y_axis_length - $y_axis_slength)%$y_division_value);
		$y_division_left = $y_axis_x-5;
		$y_division_right = $y_axis_x+5;
		$current_y_pos = $y_axis_top + $y_division_mid;
		$current_y_value = $max_y_value;
		
		$line_count = 0;
		while($current_y_pos <= $y_axis_bottom){
			$font_left_space = strlen($current_y_value."")*5;
			imagestring($this->image, 1, $y_division_left-$font_left_space, $current_y_pos-4, $current_y_value."", $this->font_color);
			imageline($this->image, $y_division_left, $current_y_pos, $y_division_right, $current_y_pos, $this->line_color);
			$current_y_pos += $y_division_mid;
			if($line_count == $x_axis_count){
				$x_axis_y = $current_y_pos;
				$current_y_value = 0;		//to avoid PHP putting something like "1628E-90" instead of 0
			}else{
				$current_y_value -= $y_division_value;
			}
			$line_count++;
		}
		
		//Painting X axis
		if (!($x_axis_y)){
			if($all_down){
				$x_axis_y = $y_axis_top;
			}else{
				$x_axis_y = $y_axis_bottom;
			}
		}
		$x_axis_left = $y_division_right;
		$x_axis_right = $this->right_border;
		imageline($this->image, $x_axis_left, $x_axis_y, $x_axis_right, $x_axis_y, $this->line_color);

		//Painting each bar
		$bar_width = ($x_axis_right - $x_axis_left)/count($data);
		$bar_side_space = $bar_width*((100-abs($wi_p))/200);
		$current_x_pos = $x_axis_left;
		foreach($data as $prod => $sub_data){
			$currentbar_rel_height = $sub_data[0] * $conversion_factor;
			$currentbar_color = imagecolorallocate($this->image, ($sub_data[1]+0), ($sub_data[2]+0), ($sub_data[3]+0));
			$currentbar_varedge = $x_axis_y-$currentbar_rel_height;
			if ($currentbar_varedge > $x_axis_y){
				imagefilledrectangle($this->image, $current_x_pos+$bar_side_space+8, $x_axis_y, $current_x_pos+$bar_width-$bar_side_space-8, $currentbar_varedge, $currentbar_color);
			}else{ #+8's and -8's are used to make the bars thinner
				imagefilledrectangle($this->image, $current_x_pos+$bar_side_space+8, $currentbar_varedge, $current_x_pos+$bar_width-$bar_side_space-8, $x_axis_y-1, $currentbar_color); # add +1 so black line is visible below bar
			}
			$font_left_space = (strlen($prod)*6)/2; #changed 5 to 6 to better center text
			imagestring($this->image, 2, $current_x_pos+($bar_width/2)-($font_left_space), $x_axis_y, $prod, $this->font_color);

			$current_x_pos += $bar_width;
		}
		
		//Printing Title
		$font_left_space = (strlen($this->title)*7)/2;
		imagestring($this->image, 3, ($this->width/2)-($font_left_space), 0, $this->title, $this->font_color);
		
		//Printing Y Axis Title
		imagestring($this->image, 2, $this->left_border*.5, $this->top_border*.25, $y_t."", $this->font_color);

		//Printing X Axis Title
		$font_left_space = strlen($x_t."")*6;
		imagestring($this->image, 2, $this->width-$font_left_space, $x_axis_y+1, $x_t."", $this->font_color);

		//Printing Legend
		if($this->legend){
			$legend_data = Array();
			foreach($data as $prod => $sub_data){
				$legend_data[$prod] = Array($sub_data[1],$sub_data[2],$sub_data[3]);
			}
			$this->_do_legend($legend_data);
		}

		//Return image
		header('Content-type: image/png');
		imagepng($this->image);
		imagedestroy($this->image);
	}

	//Pie Graph.
	//	Array format:
	//		Name of pie slice => (absolute value of slice, red, green, blue)
	//	Defaults:
	//		Black color
	//		Pie filling the whole image
	//		With piece labels
	function pie_graph($data, $p_o=100, $put_pieces=true){
		//Get center of pie
		$pie_center_x = ($this->right_border + $this->left_border)/2;
		$pie_center_y = ($this->top_border + $this->bottom_border)/2;
		$pie_width = ($this->right_border - $this->left_border)*$p_o/100;
		$pie_height = ($this->bottom_border - $this->top_border)*$p_o/100;
		$ellipse_a = ceil($pie_width/2);
		$ellipse_b = ceil($pie_height/2);
		$ellipse_a2 = pow($ellipse_a,2);
		$ellipse_b2 = pow($ellipse_b,2);

		//Proportion from this ellipse between x and y
		$e = $pie_height/$pie_width;
		$circle_radius = ($pie_height > $pie_width) ? $pie_height : $pie_width;

		//Draw lines, fill with color and label each pie slice
		$specs = $this->_get_specs($data,"pie");
		$total_degree_width = 0;
		$data_total_elements = count($data);
		$curr_ele = 1;
		
		foreach($data as $prod => $subarray){
			//Getting degree width of slice
			if ($curr_ele == $data_total_elements){
				$degree_width = 360 - $total_degree_width;

				//Thanks for Nam Phando for this next three lines.
				//The last value of the array can have a negative value
				//because of rounding errors, so these takes care of it.
				if ($degree_width < 0){
					$degree_width = 0;
				}
			}else{

				//Usage of round, recommended by Nam Phando.
				$degree_width = round((($subarray[0]+0) / $specs['total'])*360);
			}
			$curr_ele++;
			
			//Drawing slice with its color
			imagefilledarc($this->image, $pie_center_x, $pie_center_y, $pie_width, $pie_height, $total_degree_width, $total_degree_width+$degree_width, imagecolorallocate($this->image,$subarray[1]+0,$subarray[2]+0,$subarray[3]+0),IMG_ARC_PIE);

			//Drawing outline with line color
			imagefilledarc($this->image, $pie_center_x, $pie_center_y, $pie_width, $pie_height, $total_degree_width, $total_degree_width+$degree_width, $this->line_color,IMG_ARC_NOFILL | IMG_ARC_EDGED);

			//Printing label
			if($put_pieces){
				$circle_angle = $total_degree_width+($degree_width/2);
	
				//Obtaining Y of the circle from which this ellipse was squished from
				$circle_angle_x = $circle_radius*cos(deg2rad($circle_angle));
				$circle_angle_y = $circle_radius*sin(deg2rad($circle_angle));
				if ($pie_height > $pie_width){
					//Obtaining x for this ellipse, because we know that if we’re here, $circle_angle_y == $label_y
					$circle_angle_x = $circle_angle_x/$e;
				}else{
					//Obtaining y for this ellipse, because we know that if we’re here, $circle_angle_x == $label_x
					$circle_angle_y = $circle_angle_y*$e;
				}
	
				$label_angle = rad2deg(atan($circle_angle_y/$circle_angle_x));
				if($circle_angle_y < 0 && $circle_angle_x < 0){
					$label_angle += 180;
				}else if($circle_angle_y < 0){
					$label_angle = 360 + $label_angle;
				}else if($circle_angle_x < 0){
					$label_angle += 180;
				}
				
				$label_radius = ceil(sqrt($ellipse_b2*$ellipse_a2/(($ellipse_b2*pow(cos(deg2rad($label_angle)),2))+($ellipse_a2*pow(sin(deg2rad($label_angle)),2)))));
				if($label_angle > 90 && $label_angle < 180){
					$label_radius += (abs(strlen($prod."")*3)*abs(sin(deg2rad($label_angle-90))));
				}else if($label_angle >= 180 && $label_angle <= 270){
					$label_radius += (abs(strlen($prod."")*3)*abs(sin(deg2rad($label_angle-90))))+(10*abs(sin(0.5*deg2rad($label_angle))));
				}else if($label_angle > 270){
					$label_radius -= (abs(strlen($prod."")*3)*abs(sin(deg2rad($label_angle-90))));
				}
	
				$label_x = $label_radius*cos(deg2rad($label_angle));
				$label_y = $label_radius*sin(deg2rad($label_angle));
	
				imagestring($this->image, 2, $pie_center_x+$label_x, $pie_center_y+$label_y, $prod."", $this->font_color);
			}
			//Getting starting point of next slice
			$total_degree_width+=$degree_width;
		}

		//Printing title
		$font_left_space = (strlen($this->title)*7)/2;
		imagestring($this->image, 3, ($this->width/2)-($font_left_space), 0, $this->title, $this->font_color);

		//Printing legend
		if($this->legend){
			$legend_data = Array();
			foreach($data as $prod => $sub_data){
				$legend_data[$prod] = Array($sub_data[1],$sub_data[2],$sub_data[3]);
			}
			$this->_do_legend($legend_data);
		}
		
		//Return image
		header('Content-type: image/png');
		imagepng($this->image);
		imagedestroy($this->image);
	}





	
	/****************** Protected methods *******************/
	//Gets the highest value, lowest value, and average out of an array.
	function _get_specs($data, $type){
		switch($type){
			case "line":
				$longest = 0;
				$longest_index = "";
				$min = $data[key($data)][0];	//get the first element to search for
												//lowest value
				foreach($data as $i => $sub_array){
					$this_max = max($sub_array);
					$this_min = min($sub_array);
					$length = count($sub_array);
					if($max < $this_max){
						$max = $this_max;
					}
					if($min > $this_min){
						$min = $this_min;
					}
					if($longest < $length){
						$longest = $length;
						$longest_index = $i;
					}
				}
				return Array("max_value" => $max,"min_value" => $min, "length" => $longest, "ref_length" => $longest_index);

			case "bar":
				$max = $data[key($data)][0];
				$min = $data[key($data)][0];	//get the first element to search for
												//lowest value
				foreach($data as $i => $sub_array){
					if($max < $sub_array[0]){
						$max = $sub_array[0];
					}
					if($min > $sub_array[0]){
						$min = $sub_array[0];
					}
				}
				return Array("max_value" => $max,"min_value" => $min);
			
			case "pie":
				$total = 0;
				foreach($data as $i => $sub_array){
					$total += $sub_array[0];
				}
				return Array("total" => $total);
			break;
		}
	}
	
	//Displays the legend
	//	Array format:
	//		Name => (red, green, blue)
	function _do_legend($data){
		$longest_name_length = 0;
		foreach($data as $name => $sub_data){
			if (strlen($name) > $longest_name_length) $longest_name_length = strlen($name);
		}
		$current_x_pos = $this->legend_x - ($longest_name_length*5);
		$current_y_pos = $this->legend_y;
		foreach($data as $name => $sub_data){
			$current_color = imagecolorallocate($this->image, ($sub_data[0]+0), ($sub_data[1]+0), ($sub_data[2]+0));
			imagefilledrectangle($this->image, $current_x_pos-10,$current_y_pos+1, $current_x_pos-5,$current_y_pos+6,$current_color);
			imagestring($this->image, 1, $current_x_pos, $current_y_pos, $name, $this->font_color);
			$current_y_pos += 10;
		}
	}
}}

?>