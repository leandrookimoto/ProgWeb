<?php
namespace EquipamentoSonoro;

class EquipamentoSonoro extends \Equipamento\Equipamento2
{
  public $volume;
  public $stereo;
  function __construct()
  {

  }

  function mono(){
    $stereo = false;
  }
  function stereo(){
    $stereo = true;
  }
  function setVolume($volume){
    $this->volume = $volume;
  }
  function liga(){
    $ligado = true;
    $volume = 5;
  }

  function imprime(){
   echo $ligado . " "  . $volume . " " . $stereo;
  }

}
