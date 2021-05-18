<?php

use yii\db\Migration;

/**
 * Class m210518_152659_usuario_nuevos_permisos
 */
class m210518_152659_usuario_nuevos_permisos extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->insert('programa_has_usuario', [
            'userid' => 2,
            'programaid' => 7,
            'permiso' => 'prestacion_ver'
        ]);
        $this->insert('programa_has_usuario', [
            'userid' => 2,
            'programaid' => 7,
            'permiso' => 'prestacion_crear'
        ]);
        $this->insert('programa_has_usuario', [
            'userid' => 2,
            'programaid' => 7,
            'permiso' => 'prestacion_acreditar',
        ]);
        $this->insert('programa_has_usuario', [
            'userid' => 2,
            'programaid' => 7,
            'permiso' => 'prestacion_baja',
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210518_152659_usuario_nuevos_permisos cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210518_152659_usuario_nuevos_permisos cannot be reverted.\n";

        return false;
    }
    */
}
