#!/bin/bash

SERVO_DIR="../servo-dogchat/"
SERVO_COMMIT=$(cat Cargo.toml | grep -E '^libservo = ' | sed 's/.*, rev = "\(.*\)".*/\1/')


if [ ! -d $SERVO_DIR ]; then
  git clone https://github.com/servo/servo.git $SERVO_DIR
fi

pushd $SERVO_DIR
git checkout master
git pull
git checkout $SERVO_COMMIT
popd

cp -r ${SERVO_DIR}/{rust-toolchain,Cargo.lock,resources} ./
