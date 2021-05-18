<?php

use app\models\Programa;
use yii\db\Migration;

/**
 * Class m210518_154403_nuevos_tipo_recurso
 */
class m210518_154403_nuevos_tipo_recurso extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        #Registramos nuevos tipo de recursos
        $this->insert('tipo_recurso', [
            'id' => 5,
            'nombre' => 'Cultura'
        ]);
        $this->insert('tipo_recurso', [
            'id' => 6,
            'nombre' => 'Deporte'
        ]);
        $this->insert('tipo_recurso', [
            'id' => 7,
            'nombre' => 'Apoyo Escolar'
        ]);
        $this->insert('tipo_recurso', [
            'id' => 8,
            'nombre' => 'Ciencia y Tecnologia'
        ]);
        $this->insert('tipo_recurso', [
            'id' => 9,
            'nombre' => 'Otro'
        ]);

        #Vinculamos tipo de recurso al programa Recrear
        $programaid = Programa::RECREAR;

        $this->insert('programa_has_tipo_recurso', [
            'programaid' => 7,
            'tipo_recursoid' => 5
        ]);
        $this->insert('programa_has_tipo_recurso', [
            'programaid' => 7,
            'tipo_recursoid' => 6
        ]);
        $this->insert('programa_has_tipo_recurso', [
            'programaid' => 7,
            'tipo_recursoid' => 7
        ]);
        $this->insert('programa_has_tipo_recurso', [
            'programaid' => 7,
            'tipo_recursoid' => 8
        ]);

        #En Todos los programas vinculamos el tipo_recurso = 'Otro
        $this->insert('programa_has_tipo_recurso', [
            'programaid' => 1,
            'tipo_recursoid' => 9
        ]);$this->insert('programa_has_tipo_recurso', [
            'programaid' => 2,
            'tipo_recursoid' => 9
        ]);$this->insert('programa_has_tipo_recurso', [
            'programaid' => 3,
            'tipo_recursoid' => 9
        ]);$this->insert('programa_has_tipo_recurso', [
            'programaid' => 4,
            'tipo_recursoid' => 9
        ]);$this->insert('programa_has_tipo_recurso', [
            'programaid' => 5,
            'tipo_recursoid' => 9
        ]);$this->insert('programa_has_tipo_recurso', [
            'programaid' => 6,
            'tipo_recursoid' => 9
        ]);$this->insert('programa_has_tipo_recurso', [
            'programaid' => 7,
            'tipo_recursoid' => 9
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210518_154403_nuevos_tipo_recurso cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210518_154403_nuevos_tipo_recurso cannot be reverted.\n";

        return false;
    }
    */
}
