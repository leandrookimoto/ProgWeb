<?php
namespace Equipamento;

class Equipamento2
{
  public $ligado;


  function __construct()
  {
  }

  function liga(){
    $ligado = true;
  }
  function desliga(){
    $ligado = false;
  }
}
