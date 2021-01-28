<?php

namespace app\models;

use app\components\VinculoInteroperableHelp;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\User;

/**
* UserSearch represents the model behind the search form about `app\models\User`.
*/
class UserSearch extends User
{
    /**
    * @inheritdoc
    */
    public function rules()
    {
        return [
            [['id', 'confirmed_at', 'blocked_at', 'created_at', 'updated_at', 'flags', 'last_login_at'], 'integer'],
            [['username', 'email', 'password_hash', 'auth_key', 'unconfirmed_email', 'registration_ip'], 'safe'],
        ];
    }

    /**
    * @inheritdoc
    */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
    * Creates data provider instance with search query applied
    *
    * @param array $params
    *
    * @return ActiveDataProvider
    */
    public function search($params)
    {
        $query = User::find();

        $pagesize = (!isset($params['pagesize']) || !is_numeric($params['pagesize']) || $params['pagesize']==0)?20:intval($params['pagesize']);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pagesize,
                'page' => (isset($params['page']) && is_numeric($params['page']))?$params['page']:0
            ],
        ]);

        $this->load($params,'');

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->leftJoin("auth_assignment as assig", "id=assig.user_id");
        $query->leftJoin("auth_item as item", "name=assig.item_name");
        
        #Filtramos a los usarios distintos con rol admin
        $query->andFilterWhere(['=', 'item.type', 1]);
        $query->andFilterWhere(['!=', 'assig.item_name', 'admin']);
        
        $query->andFilterWhere(['like', 'username', $this->username]);
        $coleccion= array();
        foreach ($dataProvider->getModels() as $value) {
            $coleccion[] = $value->toArray();
        }

        $coleccion = VinculoInteroperableHelp::vincularDatosPersona($coleccion,['apellido','nombre','nro_documento','cuil']);
        
        $paginas = ceil($dataProvider->totalCount/$pagesize);           
        $data['pagesize']=$pagesize;            
        $data['pages']=$paginas;            
        $data['total_filtrado']=$dataProvider->totalCount;
        $data['resultado']=$coleccion;
        
        return $data;
    }
}