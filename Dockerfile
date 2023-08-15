FROM python:3.10
WORKDIR /app

COPY . /app
RUN pip3 install -r requirements.txt
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["gunicorn", "wsgi:app", "-w", "2", "--threads", "2", "-b", "0.0.0.0:3000"]

EXPOSE 3000
