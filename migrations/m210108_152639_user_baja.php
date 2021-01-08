<?php

use yii\db\Migration;

/**
 * Class m210108_152639_user_baja
 */
class m210108_152639_user_baja extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'user';

        $this->addColumn($table,'baja',$this->tinyInteger()->defaultValue(0));
        $this->addColumn($table,'descripcion_baja',$this->string(100));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210108_152639_user_baja cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210108_152639_user_baja cannot be reverted.\n";

        return false;
    }
    */
}
