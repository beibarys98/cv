<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var common\models\Photo $photo */
/** @var common\models\User $user */
/** @var common\models\Date $date */
/** @var $age*/
/** @var common\models\Mail $mail */
/** @var common\models\Degree $degree */
/** @var common\models\Education $education */
/** @var $educationDP*/
/** @var common\models\Job $job */
/** @var $jobDP*/
/** @var $interest*/
/** @var common\models\Publication $publication */
/** @var $publicationDP*/
/** @var common\models\Prize $prize */
/** @var $prizeDP*/
/** @var common\models\Club $club */
/** @var $clubDP*/
/** @var $discipline*/
/** @var common\models\Qualification $qualification */
/** @var $qualificationDP*/

use yii\helpers\Html;
use yii\bootstrap5\ActiveForm;

$this->title = 'Baishev CV';
?>
<div class="site-index">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <div class="row">
        <div class="col-3">
            <div class="d-flex flex-column align-items-center">
                <?php
                if($photo->photo !== null){
                    $uploadsPosition = strpos($photo->photo, '/uploads');
                    $relativePath = substr($photo->photo, $uploadsPosition);
                }
                ?>
                <img src="<?= $photo->photo ? $relativePath : '/uploads/img.png' ?>"
                     class="img-thumbnail shadow" style="max-height: 250px; border: 1px solid black;">
                <!-- Hidden file input -->
                <?= $form->field($photo, 'newphoto')
                    ->fileInput(['id' => 'photo-upload', 'style' => 'display:none'])->label(false) ?>

                <!-- Label to trigger file input click -->
                <label for="photo-upload" class="btn btn-secondary"><?= Yii::t('app', 'Изменить фото')?></label>
            </div>
        </div>

        <div class="col-9">
            <div class="shadow p-1" style="border-radius: 10px; border: 1px solid black;">
                <?= $form->field($user, 'name')
                    ->textInput(['maxlength' => true])
                    ->label(Yii::t('app', 'Ф.И.О.'), ['style' => 'font-weight: bold;']) ?>
            </div>

            <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
                <?= $form->field($date, 'date')
                    ->textInput([
                        'placeholder' => Yii::t('app', 'дд.мм.гггг'),
                        'value' => !empty($date->date) ? Yii::$app->formatter->asDate($date->date, 'dd.MM.yyyy') : '',
                    ])
                    ->label(Yii::t('app', 'Дата рождения'), ['style' => 'font-weight: bold;']) ?>
            </div>

            <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
                <span style="font-weight: bold;">
                    <?= Yii::t('app', 'Возраст')?>:
                </span>
                <?= $age?>
            </div>

            <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
                <?= $form->field($mail, 'mail')
                    ->textInput()
                    ->label(Yii::t('app', 'Почта'), ['style' => 'font-weight: bold;']) ?>
            </div>
        </div>
    </div>

    <div class="row" style="padding-right: 12px; margin-bottom: 150px;">
        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black; font-weight: bold;">
            <?= $form->field($degree, 'degree')
                ->textarea(['rows' => 3])
                ->label(Yii::t('app', 'Ученая степень')) ?>
        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black; font-weight: bold;">
            <?= $form->field($degree, 'position')
                ->textarea(['rows' => 3])
                ->label(Yii::t('app', 'Должность')) ?>
        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
            <label class="mb-1 fw-bold">
                <?= Yii::t('app', 'Образование')?>
            </label>
            <div class="d-flex">
                <div class="col-2 pe-2">
                    <?= $form->field($education, "year")
                        ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'class' => 'form-control'])
                        ->label(false) ?>
                </div>
                <div class="col-10">
                    <?= $form->field($education, "education")
                        ->textarea(['class' => 'form-control', 'rows' => 3])
                        ->label(false) ?>
                </div>
            </div>
            <?php foreach ($educationDP->query->all() as $edp): ?>
                <div class="d-flex">
                    <div class="col-2 pe-2">
                        <?= $form->field($edp, "year")
                            ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-9 pe-2">
                        <?= $form->field($edp, "education")
                            ->textarea(['rows' => 3, 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-1">
                        <?= Html::a(Yii::t('app', 'x'),
                            ['delete', 'type' => 'education', 'id' => $edp->id], ['class' => 'btn btn-danger w-100']) ?>
                    </div>
                </div>
            <?php endforeach; ?>


        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
            <label class="mb-1 fw-bold">
                <?= Yii::t('app', 'Трудовая деятельность')?>
            </label>
            <div class="d-flex">
                <div class="col-2 pe-2">
                    <?= $form->field($job, "year")
                        ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'class' => 'form-control'])
                        ->label(false) ?>
                </div>
                <div class="col-10">
                    <?= $form->field($job, "job")
                        ->textarea(['class' => 'form-control', 'rows' => 3])
                        ->label(false) ?>
                </div>
            </div>
            <?php foreach ($jobDP->query->all() as $jdp): ?>
                <div class="d-flex">
                    <div class="col-2 pe-2">
                        <?= $form->field($jdp, "year")
                            ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-9 pe-2">
                        <?= $form->field($jdp, "job")
                            ->textarea(['rows' => 3, 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-1">
                        <?= Html::a(Yii::t('app', 'x'),
                            ['delete', 'type' => 'job', 'id' => $jdp->id], ['class' => 'btn btn-danger w-100']) ?>
                    </div>
                </div>
            <?php endforeach; ?>

        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black; font-weight: bold;">
            <?= $form->field($interest, 'interest')
                ->textarea(['rows' => 3])
                ->label(Yii::t('app', 'Основные научные интересы')) ?>
        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
            <label class="mb-1" style="font-weight: bold;">
                <?= Yii::t('app', 'Основные публикаций за последние 5 лет')?>
            </label>
            <div class="d-flex">
                <div class="col-2 pe-2">
                    <?= $form->field($publication, "year")
                        ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'class' => 'form-control'])
                        ->label(false) ?>
                </div>
                <div class="col-10">
                    <?= $form->field($publication, "publication")
                        ->textarea(['class' => 'form-control', 'rows' => 3])
                        ->label(false) ?>
                </div>
            </div>
            <?php foreach ($publicationDP->query->all() as $pdp): ?>
                <div class="d-flex">
                    <div class="col-2 pe-2">
                        <?= $form->field($pdp, "year")
                            ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-9 pe-2">
                        <?= $form->field($pdp, "publication")
                            ->textarea(['rows' => 3, 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-1">
                        <?= Html::a(Yii::t('app', 'x'),
                            ['delete', 'type' => 'publication', 'id' => $pdp->id], ['class' => 'btn btn-danger w-100']) ?>
                    </div>
                </div>
            <?php endforeach; ?>

        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
            <label class="mb-1" style="font-weight: bold;">
                <?= Yii::t('app', 'Награды и присужденные премий')?>
            </label>
            <div class="d-flex">
                <div class="col-2 pe-2">
                    <?= $form->field($prize, "year")
                        ->textInput(['placeholder' => Yii::t('app', 'гггг'), 'class' => 'form-control'])
                        ->label(false) ?>
                </div>
                <div class="col-10">
                    <?= $form->field($prize, "prize")
                        ->textarea(['class' => 'form-control', 'rows' => 3])
                        ->label(false) ?>
                </div>
            </div>
            <?php foreach ($prizeDP->query->all() as $prdp): ?>
                <div class="d-flex">
                    <div class="col-2 pe-2">
                        <?= $form->field($prdp, "year")
                            ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-9 pe-2">
                        <?= $form->field($prdp, "prize")
                            ->textarea(['rows' => 3, 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-1">
                        <?= Html::a(Yii::t('app', 'x'),
                            ['delete', 'type' => 'prize', 'id' => $prdp->id], ['class' => 'btn btn-danger w-100']) ?>
                    </div>
                </div>
            <?php endforeach; ?>

        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
            <label class="mb-1" style="font-weight: bold;">
                <?= Yii::t('app', 'Членство в советах и профессиональных сообществах')?>
            </label>
            <div class="d-flex">
                <div class="col-2 pe-2">
                    <?= $form->field($club, "year")
                        ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'class' => 'form-control'])
                        ->label(false) ?>
                </div>
                <div class="col-10">
                    <?= $form->field($club, "club")
                        ->textarea(['class' => 'form-control', 'rows' => 3])
                        ->label(false) ?>
                </div>
            </div>
            <?php foreach ($clubDP->query->all() as $cdp): ?>
                <div class="d-flex">
                    <div class="col-2 pe-2">
                        <?= $form->field($cdp, "year")
                            ->textInput(['placeholder' => Yii::t('app', 'гггг-гггг'), 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-9 pe-2">
                        <?= $form->field($cdp, "club")
                            ->textarea(['rows' => 3, 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-1">
                        <?= Html::a(Yii::t('app', 'x'),
                            ['delete', 'type' => 'club', 'id' => $cdp->id], ['class' => 'btn btn-danger w-100']) ?>
                    </div>
                </div>
            <?php endforeach; ?>

        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black; font-weight: bold;">
            <?= $form->field($discipline, 'discipline')
                ->textarea(['rows' => 3])
                ->label(Yii::t('app', 'Преподаваемые дисциплины')) ?>
        </div>

        <div class="mt-3 shadow p-1" style="border-radius: 10px; border: 1px solid black;">
            <label class="mb-1" style="font-weight: bold;">
                <?= Yii::t('app', 'Повышение квалификации')?>
            </label>
            <div class="d-flex">
                <div class="col-2 pe-2">
                    <?= $form->field($qualification, "startDate")
                        ->textInput(['placeholder' => Yii::t('app', 'дд.мм.гггг'), 'class' => 'form-control'])
                        ->label(false) ?>
                </div>
                <div class="col-2 pe-2">
                    <?= $form->field($qualification, "endDate")
                        ->textInput(['placeholder' => Yii::t('app', 'дд.мм.гггг'), 'class' => 'form-control'])
                        ->label(false) ?>
                </div>
                <div class="col-8">
                    <?= $form->field($qualification, "qualification")
                        ->textarea(['class' => 'form-control', 'rows' => 3])
                        ->label(false) ?>
                </div>
            </div>
            <?php foreach ($qualificationDP->query->all() as $qdp): ?>
                <div class="d-flex">
                    <div class="col-2 pe-2">
                        <?= $form->field($qdp, "startDate")
                            ->textInput([
                                'placeholder' => Yii::t('app', 'дд.мм.гггг'),
                                'value' => !empty($qdp->startDate)
                                    ? Yii::$app->formatter->asDate($qdp->startDate, 'dd.MM.yyyy')
                                    : '',
                                'disabled' => true
                            ])
                            ->label(false) ?>
                    </div>
                    <div class="col-2 pe-2">
                        <?= $form->field($qdp, "endDate")
                            ->textInput([
                                'placeholder' => Yii::t('app', 'дд.мм.гггг'),
                                'value' => !empty($qdp->endDate)
                                    ? Yii::$app->formatter->asDate($qdp->endDate, 'dd.MM.yyyy')
                                    : '',
                                'disabled' => true
                            ])
                            ->label(false) ?>
                    </div>
                    <div class="col-7 pe-2">
                        <?= $form->field($qdp, "qualification")
                            ->textarea(['rows' => 3, 'disabled' => true])
                            ->label(false) ?>
                    </div>
                    <div class="col-1">
                        <?= Html::a(Yii::t('app', 'x'),
                            ['delete', 'type' => 'qualification', 'id' => $qdp->id], ['class' => 'btn btn-danger w-100']) ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="form-group">
            <?= Html::submitButton(Yii::t('app', 'Сохранить'),
                [
                    'class' => 'btn btn-success rounded-circle',
                    'style' => 'position: fixed;
                                bottom: 4%;
                                right: 9%;
                                z-index: 1000;
                                width: 107px;
                                height: 107px;'
                ]) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
