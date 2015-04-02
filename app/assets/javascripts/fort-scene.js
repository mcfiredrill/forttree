var FortScene = function($container) {
  this.$container = $container;
};

FortScene.prototype.addLighting = function(scene) {
  var lights = [];
  var strength = 50;
  lights[0] = new THREE.PointLight(0xfbff00, 1, strength);
  lights[1] = new THREE.PointLight(0xff00fa, 1, strength);
  lights[2] = new THREE.PointLight(0x00feff, 1, strength);

  lights[0].position.set(0, 1, 0);
  lights[1].position.set(0, 0.5, 0.7);
  lights[2].position.set(0, 1, -0.1);

  scene.add(lights[0]);
  scene.add(lights[1]);
  scene.add(lights[2]);

  //var light = new THREE.AmbientLight(0xffffff);
  //this.scene.add(light);
  var directionalLight = new THREE.DirectionalLight(0xffffff, 1.5);
  directionalLight.position.set(100, 100, 50);
  scene.add(directionalLight);
};

/**
 * Draw the scene / start the render loop.
 */
FortScene.prototype.draw = function($container) {
  // Initialize the 3d crap.
  var w = this.$container.innerWidth();
  var h = $(window).innerHeight() - $('header').innerHeight() - 50;

  this.scene = new THREE.Scene();
  this.camera = new THREE.PerspectiveCamera(60, w / h, 0.1, 1000);
  this.renderer = new THREE.WebGLRenderer({
    alpha: true,
    antialias: true
  });

  this.renderer.setSize(w, h);
  $container.append(this.renderer.domElement);

  var me = this;
  // TODO render text
  $('#branches img,#forttree-content img').each(function(k, v) {
    // Add a three.js sprite for each img in the board
    var url = $(v).attr('src');
    if (url.indexOf('spinner.gif') !== -1) {
      return;
    }

    THREE.ImageUtils.crossOrigin = '';
    var map = THREE.ImageUtils.loadTexture(url, {}, function() {
      me.renderer.render(me.scene, me.camera);
    });

    var material = new THREE.SpriteMaterial({
      map: map,
      color: 0xffffff,
      fog: true
    });

    var sprite = new THREE.Sprite(material);
    sprite.position.set(Math.random(), Math.random(), Math.random());

    me.scene.add(sprite);
  });

  // Draw logo
  var map = THREE.ImageUtils.loadTexture('/assets/fortchan-funny.png', {}, function() {
    me.renderer.render(me.scene, me.camera);
  });

  var material = new THREE.SpriteMaterial({
    map: map,
    color: 0xffffff,
    fog: true
  });

  var sprite = new THREE.Sprite(material);
  sprite.position.set(1, 1, 1);

  me.scene.add(sprite);

  // Draw ground
  var groundGeometry = new THREE.PlaneBufferGeometry(44, 130, 0);
  var ground = new THREE.Mesh(
    groundGeometry,
    new THREE.MeshLambertMaterial({
      color: 0xd092f0
    })
  );
  ground.position.x = -15;
  ground.position.y = -0.61;
  ground.rotation.x = -Math.PI / 2;
  this.scene.add(ground);

  // Draw ground2
  var ground2Geometry = new THREE.PlaneBufferGeometry(44, 130, 0);
  var ground2 = new THREE.Mesh(
    ground2Geometry,
    new THREE.MeshPhongMaterial({
      color: 0xd0f2e0
    })
  );
  ground2.position.x = -20;
  ground2.position.y = -0.61;
  ground2.position.z = -25;
  this.scene.add(ground2);

  this.camera.position.set(3, 1, 1);
  this.camera.lookAt(new THREE.Vector3(0, 0, 0));

  this.addLighting(this.scene);

  var axisHelper = new THREE.AxisHelper(50);
  this.scene.add(axisHelper);

  this.animate();
};

/**
 * This function creates the three.js stage if it's not already there.
 */
FortScene.prototype.init = function() {
  this.i = 1;
  this.ascending = true;

  this.$container.find('#forttree-content').hide();

  var $3dContainer = this.$container.find('#forttree-3d-content');
  if ($3dContainer.children().length === 0) {
    this.draw($3dContainer);
  }

  $3dContainer.show();

  var me = this;
  $(window).on('resize', function() {
    var w = me.$container.innerWidth();
    var h = $(window).innerHeight() - $('header').innerHeight() - 50;
    var $canvas = me.$container.find('canvas');
    $canvas.width(w);
    $canvas.height(h);
  });
};

/**
 * Animate the three.js scene.
 */
FortScene.prototype.animate = function() {
  requestAnimationFrame(this.animate.bind(this));

  var n = Math.sin(this.i / 5000);
  this.camera.rotation.z -= n;
  this.camera.rotation.x -= n / 2;

  if (this.ascending) {
    this.i = this.i + Math.sqrt(this.i) / 20;
  } else {
    this.i = this.i - Math.sqrt(this.i / 2) / 20;
  }

  if (this.i <= 1) {
    this.ascending = true;
  } else if (this.i >= 10) {
    this.ascending = false;
  }

  this.renderer.render(this.scene, this.camera);
};
