<?php

use yii\db\Migration;

/**
 * Class m190730_144525_add_localidadid_to_recurso_social
 */
class m190730_144525_add_localidadid_to_recurso_social extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = "recurso";
        $this->addColumn($table, 'localidadid', $this->integer()->null()->comment('Este atributo hace referencia al sistema Lugar (interoperabilidad)'));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190730_144525_add_localidadid_to_recurso_social cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190730_144525_add_localidadid_to_recurso_social cannot be reverted.\n";

        return false;
    }
    */
}
