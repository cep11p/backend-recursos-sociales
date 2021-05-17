<?php

use yii\db\Migration;

/**
 * Class m210517_164854_borrar_atributos_recurso
 */
class m210517_164854_borrar_atributos_recurso extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'recurso';
        $this->dropColumn($table, 'monto_mensual');
        $this->dropColumn($table, 'monto_acreditado');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210517_164854_borrar_atributos_recurso cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210517_164854_borrar_atributos_recurso cannot be reverted.\n";

        return false;
    }
    */
}
