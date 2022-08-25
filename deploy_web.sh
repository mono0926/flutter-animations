#!/usr/bin/env zsh

flutter build web
rm -rf firebase/public/animation
mv build/web firebase/public/animation
cd firebase
firebase deploy --only hosting:animation
