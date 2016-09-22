<?php

include "Equipamento.php";
include "EquipamentoSonoro.php";

$e1 = new \EquipamentoSonoro\EquipamentoSonoro();
$e1->liga();
$e1->mono();

$e1->imprime();

$e2 = new \EquipamentoSonoro\EquipamentoSonoro();
$e2->liga();
$e2->setVolume(8);
$e2->stereo();
