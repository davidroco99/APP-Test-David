<?php

class Conexion{

	static public function conectar(){

		$link = new PDO("mysql:host=localhost;dbname=id13467817_pos",
			            "id13467817_root",
			            "RicardoRoco-1985");

		$link->exec("set names utf8");

		return $link;

	}

}
