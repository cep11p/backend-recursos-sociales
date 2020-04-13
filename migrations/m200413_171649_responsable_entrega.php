<?php

use yii\db\Migration;

/**
 * Class m200413_171649_responsable_entrega
 */
class m200413_171649_responsable_entrega extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'responsable';
        $this->createTable($table, [
            'id'=> $this->primaryKey(),
            'tipo_responsable'=> $this->integer()->notNull(),
            'responsableid'=> $this->integer()->notNull(),
        ]);
        $this->addCommentOnColumn($table, 'responsableid', 'estos responsables son obtenidos desde el sistema lugar mediante interoperablidad, donde el tipo de responsable nos identifica que tabla viene el responsable');
        $this->addCommentOnColumn($table, 'tipo_responsable', 'esto nos permite tener multiples tipos de responsables. ej municipio, delegacion, comision de fomente,etc');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200413_171649_responsable_entrega cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200413_171649_responsable_entrega cannot be reverted.\n";

        return false;
    }
    */
}
