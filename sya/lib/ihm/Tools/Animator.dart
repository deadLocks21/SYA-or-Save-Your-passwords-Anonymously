import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// Class use for the differents animations
class Animator {
  /// Controler of the animation
  AnimationController _controller;

  /// Different animations for the different cases
  Animation<Offset> _offsetAnimationInL;
  Animation<Offset> _offsetAnimationInR;
  Animation<Offset> _offsetAnimationOutL;
  Animation<Offset> _offsetAnimationOutR;

  /// Boolean variables to control where the nimation go.
  bool right;
  bool enter;


  /// Initilize the variable _controller and the others variable.
  Animator(AnimationController controller, {right, enter}) {
    _controller = controller;

    _offsetAnimationInR = Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationInL = Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationOutR = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationOutL = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    this.right = right != null ? right : false;
    this.enter = enter != null ? enter : true;

    print("enter $enter; right $right; this.enter ${this.enter}; this.right ${this.right}");
  }


  /// Dispose the controller.
  disposeControler() => _controller.dispose();


  /// Play the animation
  play() => _controller.forward(from: 0.0);

  /// Return the good animation
  animation() => enter ? (right ? _offsetAnimationInR : _offsetAnimationInL)  : (right ? _offsetAnimationOutR : _offsetAnimationOutL);
}
