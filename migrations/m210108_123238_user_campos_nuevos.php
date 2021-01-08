<?php

use yii\db\Migration;

/**
 * Class m210108_123238_user_campos_nuevos
 */
class m210108_123238_user_campos_nuevos extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'user';
        $this->addColumn($table, 'personaid', $this->integer());
        $this->addColumn($table, 'localidadid', $this->integer());

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210108_123238_user_campos_nuevos cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210108_123238_user_campos_nuevos cannot be reverted.\n";

        return false;
    }
    */
}
