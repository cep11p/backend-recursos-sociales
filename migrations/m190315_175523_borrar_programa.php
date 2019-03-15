<?php

use yii\db\Migration;

/**
 * Class m190315_175523_borrar_programa
 */
class m190315_175523_borrar_programa extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->delete('programa', ['id'=>6]);
        $this->delete('programa', ['id'=>7]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190315_175523_borrar_programa cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190315_175523_borrar_programa cannot be reverted.\n";

        return false;
    }
    */
}
