
# 베이스 이미지 이며 이미지 이름 앞에 아무것도 없으면 docker hub에서 가져온다.
FROM python:3.8-slim

# 컨테이너 안에 작업 폴더를 설정한다.
WORKDIR /app

# 로컬 현대 폴더의 모든 값을 컨테이너 /app 폴더에 복사한다.
ADD . /app

# pyhon의 경우 library를 requirements.txt에 기술을 하였고 RUN 명령어를 # 사용하여 아래 구문을 실행한다.

# RUN pip install -r requirements.txt

# 직접 라이브러리를 추가 할수 있다. 단 라이브러리가 많아지면 불편하다.
RUN pip3 install flask==2.0.3
RUN pip3 install flask-cors==3.0.10
RUN pip3 install flask_restx
RUN pip3 install Werkzeug==2.0.3

# 기본 이미지는 대부분 GMT+0 기준으로 생성되어 한국 시간으로 변경 해준다
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && echo Asia/Seoul > /etc/timezone

# 컨테이너 외부에서 접속할 포트를 적어준다.
EXPOSE 40003

# 컨테이너 로딩시에 사용하는 명령어를 기입한다. 
# EntryPoint와 비슷 하나 CMD를 사용하면 docker run시에 파라미터 설정 가능하다.
CMD ["python", "app.py"]
