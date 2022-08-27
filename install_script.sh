apt-get update
apt-get --assume-yes install screen zip libglib2.0-0 libsm6 libxext6 libxrender1
wget https://podfilesjanek.s3.eu-west-1.amazonaws.com/Miniconda3-latest-Linux-x86_64.sh
chmod a+x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p /workspace/conda
/workspace/conda/bin/conda init
cp /root/.bashrc /workspace/.bashrc
. /workspace/.bashrc
wget $SD_MODEL_URL
git clone https://github.com/janekm/progrock-stable.git
cd progrock-stable
conda env create -f environment.yaml
conda activate prs
cd ..
git clone https://github.com/xinntao/Real-ESRGAN.git
cd Real-ESRGAN
pip install -r requirements.txt
python setup.py develop
wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth -P experiments/pretrained_models
cd ../progrock-stable
wget $SETTINGS_URL
wget $IN_FILES_ZIP_URL
unzip gobig_in.zip
python prs.py --gobig_dir gobig_in -s my_settings.json
# bash -c "sleep infinity"