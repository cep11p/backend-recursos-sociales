<?php

use yii\db\Migration;

/**
 * Class m190408_151610_vincular_programa_has_tipo_recurso
 */
class m190408_151610_vincular_programa_has_tipo_recurso extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = "programa_has_tipo_recurso";
        $this->insert($table, ['programaid'=>1,'tipo_recursoid'=>1]);
        $this->insert($table, ['programaid'=>1,'tipo_recursoid'=>2]);
        $this->insert($table, ['programaid'=>1,'tipo_recursoid'=>3]);
        
        $this->insert($table, ['programaid'=>2,'tipo_recursoid'=>1]);
        $this->insert($table, ['programaid'=>2,'tipo_recursoid'=>2]);
        $this->insert($table, ['programaid'=>2,'tipo_recursoid'=>3]);
        $this->insert($table, ['programaid'=>3,'tipo_recursoid'=>2]);
        
        $this->insert($table, ['programaid'=>4,'tipo_recursoid'=>2]);
        
        $this->insert($table, ['programaid'=>5,'tipo_recursoid'=>3]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190408_151610_vincular_programa_has_tipo_recurso cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190408_151610_vincular_programa_has_tipo_recurso cannot be reverted.\n";

        return false;
    }
    */
}
