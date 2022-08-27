apt-get update
apt-get --assume-yes install screen zip
git clone https://github.com/janekm/progrock-stable.git
git clone https://github.com/xinntao/Real-ESRGAN.git
cd Real-ESRGAN
pip install -r requirements.txt
pip install omegaconf
python setup.py develop
wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth -P experiments/pretrained_models
cd ../progrock-stable
wget $SETTINGS_URL
wget $IN_FILES_ZIP_URL
unzip gobig_in.zip
ln ../model.ckpt models/sd-v1-4.ckpt
python prs.py --gobig_dir gobig_in -s my_settings.json
zip out.zip ./out/Default/*

# bash -c "sleep infinity"