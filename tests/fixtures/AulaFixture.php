<?php

namespace app\tests\fixtures;
use yii\test\ActiveFixture;

class AulaFixture extends ActiveFixture{
    
    public $modelClass = '\app\models\Aula';
    
    public function init() {
        $this ->dataFile = \Yii::getAlias('@app').'/tests/_data/aula.php';
        parent::init();
    }
    
    public function unload()
    {
        parent::unload();
        $this->resetTable();
    }
    
}

