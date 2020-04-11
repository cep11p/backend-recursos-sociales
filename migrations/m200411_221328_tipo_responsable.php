<?php

use yii\db\Migration;

/**
 * Class m200411_221328_tipo_responsable
 */
class m200411_221328_tipo_responsable extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('tipo_responsable', [
            'id'=> $this->primaryKey(),
            'nombre'=> $this->string('200')->notNull(),
        ]);
        
        $this->insert('tipo_responsable', ['nombre'=>'municipio']);
        $this->insert('tipo_responsable', ['nombre'=>'delegacion']);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200411_221328_tipo_responsable cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200411_221328_tipo_responsable cannot be reverted.\n";

        return false;
    }
    */
}
