<?
require_once 'gdgraph.ssi.php';

$x = $_GET['x'];
$y = $_GET['y'];
$z = $_GET['z'];

for ($i = 0; $i <= 50; $i++) {
	$a = floor($x*$i*$i + $y*$i + $z);
	$arr[$i] = Array($a,100,149,237);
}

$gdg = new GDGraph(960,200, 'HP Calculator', 255,255,255,0,0,0,0,0,0, false);

			


$gdg->bar_graph($arr);

?>