<?php

use yii\db\Migration;

/**
 * Class m200421_230417_add_fecha_entrega_to_recurso
 */
class m200421_230417_add_fecha_entrega_to_recurso extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'recurso';
        $this->addColumn($table, 'fecha_entrega', $this->date());
        $this->addCommentOnColumn($table, 'fecha_entrega', 'Este atributo nos indica la fecha de entrega de la prestacion');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200421_230417_add_fecha_entrega_to_recurso cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200421_230417_add_fecha_entrega_to_recurso cannot be reverted.\n";

        return false;
    }
    */
}
