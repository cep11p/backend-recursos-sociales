<?php

use yii\db\Migration;

/**
 * Class m210407_162606_cuota
 */
class m210407_162606_cuota extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'cuota';
        $this->addColumn($table, 'create_at', $this->timestamp());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210407_162606_cuota cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210407_162606_cuota cannot be reverted.\n";

        return false;
    }
    */
}
