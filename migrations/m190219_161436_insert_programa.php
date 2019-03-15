<?php

use yii\db\Migration;

/**
 * Class m190219_161436_insert_programa
 */
class m190219_161436_insert_programa extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'programa';
        $this->insert($table,["id"=>4,"nombre"=>"Micro Emprendimiento"]);
        $this->insert($table,["id"=>5,"nombre"=>"Hábitat"]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190219_161436_insert_programa cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190219_161436_insert_programa cannot be reverted.\n";

        return false;
    }
    */
}
