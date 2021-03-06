<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">
    
    <link rel="shortcut icon" href="<?php echo $this->themeUrl(); ?>/ico/favicon.ico">

    <!-- Custom styles for this template + core an l¡more mixin for this template -->
    <link href="<?php echo $this->themeUrl(); ?>/css/style.min.css" rel="stylesheet">
    
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="<?php echo $this->themeUrl(); ?>/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <?php echo $this->builtHeader()?>
  </head>

  <body>

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<?php echo Yii::app()->getModule('home')->url?>"><?php echo Yii::app()->name;?></a>
        </div>
        <div class="navbar-collapse collapse">
        <?php $this->widget('zii.widgets.CMenu',array(
  			'htmlOptions'=>array('class'=>'nav navbar-nav navbar-right'),
            'items'=>array(
                array('label'=>'Home', 'url'=>Yii::app()->getModule('home')->url, 'visible'=>!Yii::app()->getModule('users')->check()),
                array('label'=>'CMS', 'url'=>Yii::app()->getModule('admin')->url, 'visible'=>Yii::app()->getModule('users')->check('admin','root')),
                array('label'=>'Ingresar',  'linkOptions'=>array("class"=>"module-users-login"), 'url'=>array('#'), 'visible'=>!Yii::app()->getModule('users')->check()),
                array('label'=>'Registrarse', 'linkOptions'=>array("data-toggle"=>"modal", "data-target"=>"#registerModal"), 'url'=>array('#'), 'visible'=>!Yii::app()->getModule('users')->check()),
                array('label'=>Yii::app()->getModule('users')->name, 'linkOptions'=>array("data-toggle"=>"modal", "data-target"=>"#profileModal"), 'url'=>array('#'), 'visible'=>Yii::app()->getModule('users')->check()),
                array('label'=>'Salir', 'url'=>Yii::app()->getModule('users')->toLogout, 'visible'=>Yii::app()->getModule('users')->check())

            ),
		)); ?>
        </div><!--/.nav-collapse -->
      </div>
    </div>
  
    <div class="container session-message">
		<?php if(($msgs=$this->builtMessages())!==null and $msgs!==array()):?>
		<div class="row">
		  <div class="col-lg-12">
		    <?php foreach($msgs as $type => $message):?>
		      <div class="alert alert-<?php echo $type?>">
		        <button type="button" class="close" data-dismiss="alert">&times;</button>
		        <?php echo $message?>
		      </div>
		    <?php endforeach;?>
		  </div>
		</div>
		<?php endif;?>
	  </div>
    <?php echo $content; ?>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="<?php echo $this->themeUrl(); ?>/js/bootstrap.min.js"></script>
    <script src="<?php echo $this->themeUrl(); ?>/js/bootbox.min.js"></script>
    <?php echo $this->builtEndBody()?>
  </body>
</html>