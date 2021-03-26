<?php

use yii\db\Migration;

/**
 * Class m210326_141916_recurso_new_attributes
 */
class m210326_141916_recurso_new_attributes extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'recurso';
        $this->addColumn($table, 'cuota', $this->boolean());
        $this->addColumn($table, 'monto_acreditado', $this->double());
        $this->addColumn($table, 'monto_mensual', $this->double());
        $this->addColumn($table, 'fecha_final', $this->double());
        $this->addCommentOnColumn($table, 'fecha_final', 'Nos indica cuando finaliza una prestacion tallerista');

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210326_141916_recurso_new_attributes cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210326_141916_recurso_new_attributes cannot be reverted.\n";

        return false;
    }
    */
}
