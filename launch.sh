#!/usr/bin/bash
tmux pipe-pane -o 'cat >/tmp/tmux_out'
rm -rf /data/media/0/realdata/*
PYTHONPATH=/data/openpilot /data/openpilot/selfdrive/test/testing_closet_client.py &

echo -n 1 > /data/params/d/CommunityFeaturesToggle
echo -n 2 > /data/params/d/HasAcceptedTerms
echo -n "0.2.0" > /data/params/d/CompletedTrainingVersion

export PASSIVE="0"
exec ./launch_chffrplus.sh
