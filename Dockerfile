FROM jupyter/base-notebook
EXPOSE 8888
RUN conda install mamba --yes
RUN mamba install dash pandas geopandas jupyter-dash jupyter-server-proxy --yes
RUN pip install dash_extensions dash-leaflet jsbeautifier
RUN pip install jupyter_contrib_nbextensions
COPY *.ipynb /home/jovyan
COPY data /home/jovyan/data
COPY assets /home/jovyan/assets
USER root
RUN chown -R jovyan *.ipynb data assets
USER jovyan:users
CMD jupyter notebook --no-browser --NotebookApp.token=""
