<?php

use yii\db\Migration;

/**
 * Class m210128_153224_usuario_descripcion_baja
 */
class m210128_153224_usuario_descripcion_baja extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->alterColumn('user_persona', 'descripcion_baja', $this->text());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210128_153224_usuario_descripcion_baja cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210128_153224_usuario_descripcion_baja cannot be reverted.\n";

        return false;
    }
    */
}
