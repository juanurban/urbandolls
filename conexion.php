<?php

class Conexion{

	static public function conectar(){

		$link = new PDO("mysql:host=localhost;dbname=kmargoco_pos",
			            "kmargoco_wp94",
			            "Morris*0211");

		$link->exec("set names utf8");

		return $link;

	}

}