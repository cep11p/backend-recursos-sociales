<?php

use yii\db\Migration;

/**
 * Class m190204_155224_insert_programa
 */
class m190204_155224_insert_programa extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'programa';
        $this->insert($table,["nombre"=>"Subsidio"]);
        $this->insert($table,["nombre"=>"Río Negro Presente"]);
        $this->insert($table,["nombre"=>"Emprender"]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190204_155224_insert_programa cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190204_155224_insert_programa cannot be reverted.\n";

        return false;
    }
    */
}
