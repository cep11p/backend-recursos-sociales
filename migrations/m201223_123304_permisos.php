<?php

use yii\db\Migration;

/**
 * Class m201223_123304_permisos
 */
class m201223_123304_permisos extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableName = 'auth_item';        
        $this->insert($tableName, ['name'=>'prestacion_crear','type'=>2,'description'=>'Permite crear una prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'prestacion_ver','type'=>2,'description'=>'Permite ver prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'prestacion_baja','type'=>2,'description'=>'Permite dar de baja prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'prestacion_acreditar','type'=>2,'description'=>'Permite acreditar prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'persona_crear','type'=>2,'description'=>'Permite registrar una persona','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'persona_modificar','type'=>2,'description'=>'Permite modificar una persona','created_at'=>time()]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m201223_123304_permisos cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m201223_123304_permisos cannot be reverted.\n";

        return false;
    }
    */
}
