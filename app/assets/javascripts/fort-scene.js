var FortScene = function($container) {
  this.$container = $container;
};

/**
 * Returns true if the testUrl is on the same origin as the site.
 */
FortScene.prototype.isSameOrigin = function(testUrl) {
  if (testUrl.indexOf('http') !== -1) {
    // This is a naive test that catches most situations.
    return testUrl.indexOf(document.domain) !== -1;
  }
  return true;
};

/**
 * This function creates the three.js stage if it's not already there.
 */
FortScene.prototype.init = function() {
    this.$container.find('#forttree-content').hide();

    var $3dContainer = this.$container.find('#forttree-3d-content');
    if ($3dContainer.children().length === 0) {
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
      $3dContainer.append(this.renderer.domElement);

      var me = this;
      // TODO render text
      $('#branches img,#forttree-content img').each(function(k, v) {
        // Add a three.js sprite for each img in the board
        var url = $(v).attr('src');
        if (!me.isSameOrigin(url)) {
          return;
        }

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

      this.camera.position.set(3, 1, 1);
      this.camera.lookAt(new THREE.Vector3(0, 0, 0));

      var light = new THREE.AmbientLight(0xf0e000);
      this.scene.add(light);
      this.animate();
    }

    $3dContainer.show();
};

/**
 * Animate the three.js scene.
 */
FortScene.prototype.animate = function() {
  requestAnimationFrame(this.animate.bind(this));
  var n = Math.min(Math.random() / 20, 0.02);
  if (this.camera.rotation.y % 2 === 0) {
    this.camera.rotation.z += n;
    this.camera.rotation.x += n / 2;
  } else {
    this.camera.rotation.z -= n;
    this.camera.rotation.x -= n / 2;
  }

  this.renderer.render(this.scene, this.camera);
};
