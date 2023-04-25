FROM python:3.10

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y
RUN pip install opencv-python
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117
RUN pip install git+https://github.com/openai/CLIP.git
#RUN pip install "git+https://github.com/ai-forever/Kandinsky-2.git"
RUN pip install "git+https://github.com/luccaportes/Kandinsky-2.git" # fix issue running on cpu only machine

WORKDIR /app

COPY test_kandinsky-2.py .

CMD ["python", "test_kandinsky-2.py"]