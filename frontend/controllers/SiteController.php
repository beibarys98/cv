<?php

namespace frontend\controllers;

use common\models\Admin;
use common\models\Club;
use common\models\Date;
use common\models\Degree;
use common\models\DegreeArr;
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
use DateTime;
use Yii;
use yii\base\InvalidArgumentException;
use yii\data\ActiveDataProvider;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use yii\web\UploadedFile;

class SiteController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    public function actions()
    {
        return [
            'error' => [
                'class' => \yii\web\ErrorAction::class,
            ],
            'captcha' => [
                'class' => \yii\captcha\CaptchaAction::class,
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex()
    {
        if(Yii::$app->user->isGuest){
            return $this->redirect(['/site/login']);
        }

        $user = User::findOne(['id' => Yii::$app->user->id]);

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

        $models = [$user, $date, $degree, $mail, $photo, $education, $job, $interest,
            $publication, $prize, $club, $discipline, $qualification,
        ];

        $allLoaded = true;

        foreach ($models as $model) {
            if (!$model->load(Yii::$app->request->post())) {
                $allLoaded = false;
                break;
            }
        }

        if ($allLoaded){
            foreach ($models as $model) {
                if ($model !== $user) {
                    $model->user_id = $user->id;
                }
            }

            $uploadedFile = UploadedFile::getInstance($photo, 'newphoto');
            if($uploadedFile !== null){
                $uploadPath = Yii::getAlias('@frontend/web/uploads/');
                $fileName = $user->username. '_'
                    .date('Y_m_d_H_i_s') . '.'
                    . $uploadedFile->extension;
                $filePath = $uploadPath . $fileName;
                if($uploadedFile->saveAs($filePath)){
                    $photo->photo = $filePath;
                    $photo->save(false);
                }
            }

            $user->save(false);

            if(!empty($date->date)){
                $year = substr($date->date, -4);
                $month = substr($date->date, 3, 2);
                $day = substr($date->date, 0, 2);
                $date->date = $year . "-" . $month . "-" . $day;
                $date->save(false);
            }

            $degree->save(false);
            $mail->save(false);
            $education->year != null && $education->education != null && $education->save(false);
            $job->year != null && $job->job != null && $job->save(false);
            $interest->save(false);
            $publication->year != null && $publication->publication != null && $publication->save(false);
            $prize->year != null && $prize->prize != null && $prize->save(false);
            $club->year != null && $club->club != null && $club->save(false);
            $discipline->save(false);

            if(!empty($qualification->startDate && !empty($qualification->endDate) && !empty($qualification->qualification))){
                $year = substr($qualification->startDate, -4);
                $month = substr($qualification->startDate, 3, 2);
                $day = substr($qualification->startDate, 0, 2);
                $qualification->startDate = $year . "-" . $month . "-" . $day;

                $year = substr($qualification->endDate, -4);
                $month = substr($qualification->endDate, 3, 2);
                $day = substr($qualification->endDate, 0, 2);
                $qualification->endDate = $year . "-" . $month . "-" . $day;

                $qualification->save(false);
            }

            return $this->redirect(['index']);
        }

        return $this->render('index', [
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

    public function actionDelete($type, $id)
    {
        $modelClass = $this->getModelClass($type);
        if ($modelClass === null) {
            throw new \yii\web\BadRequestHttpException('Invalid type specified.');
        }

        $model = $modelClass::findOne(['id' => $id]);
        if ($model !== null) {
            $model->delete();
        }

        return $this->redirect(['index']);
    }

    protected function getModelClass($type)
    {
        $modelClasses = [
            'education' => Education::class,
            'job' => Job::class,
            'publication' => Publication::class,
            'prize' => Prize::class,
            'club' => Club::class,
            'qualification' => Qualification::class,
        ];

        return $modelClasses[$type] ?? null;
    }

    public function kazakhCyrillicToLatin($name) {
        $cyrillicLetters = array(
            'а', 'ә', 'б', 'в', 'г', 'ғ', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к',
            'қ', 'л', 'м', 'н', 'ң', 'о', 'ө', 'п', 'р', 'с', 'т', 'у', 'ұ', 'ү',
            'ф', 'х', 'һ', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'і', 'ь', 'э', 'ю', 'я',
            ' ', 'А', 'Ә', 'Б', 'В', 'Г', 'Ғ', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й',
            'К', 'Қ', 'Л', 'М', 'Н', 'Ң', 'О', 'Ө', 'П', 'Р', 'С', 'Т', 'У', 'Ұ',
            'Ү', 'Ф', 'Х', 'Һ', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'І', 'Ь', 'Э', 'Ю',
            'Я'
        );

        $latinLetters = array(
            'a', 'a', 'b', 'v', 'g', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y', 'k',
            'q', 'l', 'm', 'n', 'n', 'o', 'o', 'p', 'r', 's', 't', 'u', 'u', 'u',
            'f', 'h', 'h', 'ts', 'ch', 'sh', 'sh', '', 'y', 'i', '', 'e', 'yu',
            'ya', '_', 'a', 'a', 'b', 'v', 'g', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y', 'k',
            'q', 'l', 'm', 'n', 'n', 'o', 'o', 'p', 'r', 's', 't', 'u', 'u', 'u',
            'f', 'h', 'h', 'ts', 'ch', 'sh', 'sh', '', 'y', 'i', '', 'e', 'yu',
            'ya'
        );

        return str_replace($cyrillicLetters, $latinLetters, $name);
    }

    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            Yii::$app->user->logout();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            $admin = Admin::find()->andWhere(['user_id' => Yii::$app->user->id])->one();

            if($admin){
                return $this->redirect(['/user/index']);
            }else{
                return $this->redirect(['index']);
            }
        }

        $model->password = '';

        return $this->render('login', [
            'model' => $model,
        ]);
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->redirect(['login']);
    }

    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post()) && $model->signup()) {
            Yii::$app->session->setFlash('success', 'Thank you for registration. Please check your inbox for verification email.');
            return $this->goHome();
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }

    //меняют язык здесь
    public function actionLanguage($view)
    {
        if(Yii::$app->language == 'kz-KZ'){
            Yii::$app->session->set('language', 'ru-RU');
        }else{
            Yii::$app->session->set('language', 'kz-KZ');
        }
        return $this->redirect([$view]);
    }
}
