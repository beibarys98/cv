<?php

namespace frontend\controllers;

use common\models\Club;
use common\models\Date;
use common\models\Degree;
use common\models\Discipline;
use common\models\Education;
use common\models\Interest;
use common\models\Job;
use common\models\Mail;
use common\models\Photo;
use common\models\Prize;
use common\models\Publication;
use common\models\Qualification;
use common\models\User;
use common\models\UserSearch;
use DateTime;
use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

class UserController extends Controller
{
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    public function actionIndex()
    {
        if(Yii::$app->user->isGuest){
            return $this->redirect(['/site/login']);
        }

        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        $dataProvider->pagination = false;

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionView($id)
    {
        if(Yii::$app->user->isGuest){
            return $this->redirect(['/site/login']);
        }

        $user = User::findOne(['id' => $id]); // Replace YourModel with your actual model class

        if(Photo::findOne(['user_id' => $user->id])){
            $photo = Photo::findOne(['user_id' => $user->id]);
        }else{
            $photo = new Photo();
        }

        if(Date::findOne(['user_id' => $user->id])){
            $date = Date::findOne(['user_id' => $user->id]);
            $dateOfBirth = new DateTime($date->date);
        }else{
            $date = new Date();
            $dateOfBirth = new DateTime();
        }

        $today = new DateTime();
        $age = $today->diff($dateOfBirth)->y;

        if(Mail::findOne(['user_id' => $user->id])){
            $mail = Mail::findOne(['user_id' => $user->id]);
        }else{
            $mail = new Mail();
        }

        if(Degree::findOne(['user_id' => $user->id])){
            $degree = Degree::findOne(['user_id' => $user->id]);
        }else{
            $degree = new Degree();
        }

        $education = new Education();
        $educationDP = new ActiveDataProvider([
            'query' => Education::find()->andWhere(['user_id' => $user->id])
        ]);

        $job = new Job();
        $jobDP = new ActiveDataProvider([
            'query' => Job::find()->andWhere(['user_id' => $user->id])
        ]);

        if(Interest::findOne(['user_id' => $user->id])){
            $interest = Interest::findOne(['user_id' => $user->id]);
        }else{
            $interest = new Interest();
        }

        $publication = new Publication();
        $publicationDP = new ActiveDataProvider([
            'query' => Publication::find()->andWhere(['user_id' => $user->id])
        ]);

        $prize = new Prize();
        $prizeDP = new ActiveDataProvider([
            'query' => Prize::find()->andWhere(['user_id' => $user->id])
        ]);

        $club = new Club();
        $clubDP = new ActiveDataProvider([
            'query' => Club::find()->andWhere(['user_id' => $user->id])
        ]);

        if(Discipline::findOne(['user_id' => $user->id])){
            $discipline = Discipline::findOne(['user_id' => $user->id]);
        }else{
            $discipline = new Discipline();
        }

        $qualification = new Qualification();
        $qualificationDP = new ActiveDataProvider([
            'query' => Qualification::find()->andWhere(['user_id' => $user->id])
        ]);

//        $nameParts = explode(' ', $user->name);
//        $username = $this->kazakhCyrillicToLatin(
//            implode(' ', [$nameParts[0], $nameParts[1]]));

        if ($user->load(Yii::$app->request->post())
            && $date->load(Yii::$app->request->post())
            && $degree->load(Yii::$app->request->post())
            && $mail->load(Yii::$app->request->post())
            && $photo->load(Yii::$app->request->post())
            && $education->load(Yii::$app->request->post())
            && $job->load(Yii::$app->request->post())
            && $interest->load(Yii::$app->request->post())
            && $publication->load(Yii::$app->request->post())
            && $prize->load(Yii::$app->request->post())
            && $club->load(Yii::$app->request->post())
            && $discipline->load(Yii::$app->request->post())
            && $qualification->load(Yii::$app->request->post())) {

            $uploadedFile = UploadedFile::getInstance($photo, 'newphoto');

            if ($photo->validate()
                && $user->validate()
                && $date->validate()
                && $mail->validate()
                && $degree->validate()
                && $education->validate()
                && $job->validate()
                && $interest->validate()
                && $publication->validate()
                && $prize->validate()
                && $club->validate()
                && $discipline->validate()
                && $qualification->validate()) {

                if($uploadedFile !== null){
                    $uploadPath = Yii::getAlias('@frontend/web/uploads/');
                    $fileName = $user->username. '_'
                        .\date('Y_m_d_H_i_s') . '.'
                        . $uploadedFile->extension;
                    $filePath = $uploadPath . $fileName;
                    $uploadedFile->saveAs($filePath);
                    $photo->photo = $filePath;
                }

                $photo->user_id = $user->id;
                $date->user_id = $user->id;
                $degree->user_id = $user->id;
                $mail->user_id = $user->id;
                $education->user_id = $user->id;
                $job->user_id = $user->id;
                $interest->user_id = $user->id;
                $publication->user_id = $user->id;
                $prize->user_id = $user->id;
                $club->user_id = $user->id;
                $discipline->user_id = $user->id;
                $qualification->user_id = $user->id;

                $user->save(false);
                $date->save(false);
                $degree->save(false);
                $mail->save(false);
                $photo->save(false);
                if($education->year != null){
                    $education->save(false);
                }
                if($job->year != null){
                    $job->save(false);
                }
                $interest->save(false);
                if($publication->year != null){
                    $publication->save(false);
                }
                if($prize->year != null){
                    $prize->save(false);
                }
                if($club->year != null){
                    $club->save(false);
                }
                $discipline->save();
                if($qualification->startDate != null){
                    $qualification->save(false);
                }

                return $this->redirect(['/user/view']);
            }
        }

        return $this->render('/user/view', [
            'photo' => $photo,
            'user' => $user,
            'date' => $date,
            'age' => $age,
            'mail' => $mail,
            'degree' => $degree,
            'education' => $education,
            'educationDP' => $educationDP,
            'job' => $job,
            'jobDP' => $jobDP,
            'interest' => $interest,
            'publication' => $publication,
            'publicationDP' => $publicationDP,
            'prize' => $prize,
            'prizeDP' => $prizeDP,
            'club' => $club,
            'clubDP' => $clubDP,
            'discipline' => $discipline,
            'qualification' => $qualification,
            'qualificationDP' => $qualificationDP
        ]);
    }
}
