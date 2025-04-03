In an earlier tutorial, we demonstrated how you can [train a custom AI chatbot using ChatGPT][1] API. While it works quite well, we know that once your free OpenAI credit is exhausted, you need to pay for the API, which is not affordable for everyone. In addition, several users are not comfortable sharing confidential data with OpenAI. So if you want to create a private AI chatbot without connecting to the internet or paying any money for API access, this guide is for you. PrivateGPT is a new open-source project that lets you interact with your documents privately in an AI chatbot interface. To find out more, let’s learn how to train a custom AI chatbot using PrivateGPT locally.

Table of Contents

-   [Requirements to Set up PrivateGPT on Your PC][2]
-   [Set Up the Environment to Train a Private AI Chatbot][3]
-   [How to Set Up PrivateGPT on Your PC Locally][4]
-   [Train a Custom AI Chatbot Using PrivateGPT][5]

## Requirements to Set up PrivateGPT on Your PC

1\. To run [PrivateGPT][6] locally on your machine, you **need a moderate to high-end machine**. You can’t run it on older laptops/ desktops. To give you a brief idea, I tested PrivateGPT on an entry-level desktop PC with an Intel 10th-gen i3 processor, and it took close to 2 minutes to respond to queries. Keep in mind, PrivateGPT does not use the GPU. Currently, it only relies on the CPU, which makes the performance even worse. Nevertheless, if you want to test the project, you can surely go ahead and check it out.

2\. PrivateGPT **can be used offline without connecting to any online servers** or adding any API keys from OpenAI or Pinecone. To facilitate this, it [runs an LLM model locally][7] on your computer. So, you will have to download a GPT4All-J-compatible LLM model on your computer. I have added detailed steps below for you to follow.

## Set Up the Environment to Train a Private AI Chatbot

1\. First, you need to install **Python 3.10 or later** on your Windows, macOS, or Linux computer. You can click on [this link][8] to download Python right away.

![download python](https://beebom.com/wp-content/uploads/2023/06/image-2.png?w=640)

2\. Next, run the setup file and make sure to enable the checkbox for “**Add Python.exe to PATH**.” After that, click on “Install Now” and follow the usual steps to install Python.

![install python](https://beebom.com/wp-content/uploads/2023/03/33.jpg?w=640)

3\. Next, you will need to **install Visual Studio 2022** if you are using Windows. This is done to get the **C++ CMake tool and UWP** components. Click on [this link][9] and download the “Community” version for free.

![Set Up the Environment to Train a Private AI Chatbot](https://beebom.com/wp-content/uploads/2023/06/Screenshot-2023-06-02-2.09.45-AM.jpg?w=640)

4\. Now, run the setup, and it will download another installer. A window will appear where you can choose the components. Scroll down and select “**Desktop Development with C++**” and “Universal Windows Platform development.”

![Set Up the Environment to Train a Private AI Chatbot](https://beebom.com/wp-content/uploads/2023/06/554.jpg?w=640)

5\. Next, click on the “**Install**” button at the bottom right corner. After the installation, restart your computer. You don’t need to use Visual Studio thereafter, but keep it installed.

![Set Up the Environment to Train a Private AI Chatbot](https://beebom.com/wp-content/uploads/2023/06/555.jpg?w=487)

6\. Finally, go ahead and **download the default model** (“groovy”) from [here][10]. The size is around 3.5GB. You can download other models from [this link][11] if you have a more powerful computer.

![Train a Custom AI Chatbot Using PrivateGPT Locally (Offline)](https://beebom.com/wp-content/uploads/2023/06/557.jpg?w=594)

## How to Set Up PrivateGPT on Your PC Locally

1\. First, open the [GitHub link][12] of the privateGPT repository and click on “Code” on the right. Here, click on “**Download ZIP**.”

![Set Up PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/Screenshot-2023-06-02-2.20.48-AM.jpg?w=517)

2\. Now, open the ZIP file and **extract the folder** named “privateGPT-main”.

![Set Up PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/558-1.jpg?w=563)

3\. Next, open the “privateGPT-main” folder and create a new folder named “**models**“.

![Set Up PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/559.jpg?w=640)

4\. Under the “models” folder, **paste the “groovy” model** you downloaded above.

![Set Up PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/560.jpg?w=640)

5\. Now, go back to the main folder, and you will find an “example.env” file. Rename it as just the “**.env**” file.

![Set Up PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/561.jpg?w=451)

6\. Now, right-click on the “.env” file and **open it with** **Notepad**.

![Set Up PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/562.jpg?w=640)

7\. If you have downloaded a **different model**, you can define it under “MODEL\_PATH”. Since we are using the default model, no change is needed. You can close Notepad now.

![change model path](https://beebom.com/wp-content/uploads/2023/06/563.jpg?w=640)

8\. Next, open the “**source\_documents**” folder. Here, you can add all kinds of documents to train the custom AI chatbot. As an example, the developer has added a transcript of the [State of the Union address][13] in TXT format. However, you can also add PDF, DOC, DOCX, CSV, EPUB, TXT, PPT, PPTX, ODT, MSG, MD, HTML, EML, and ENEX files here.

![source documents](https://beebom.com/wp-content/uploads/2023/06/564.jpg?w=640)

1\. Finally, it’s time to train a custom AI chatbot using PrivateGPT. **Open Terminal** on your computer. If you are using Windows, open Windows Terminal or Command Prompt.

![Train a Custom AI Chatbot Using PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/565.jpg?w=640)

2\. Now, right-click on the “privateGPT-main” folder and choose “**Copy as path**“. This will copy the path of the folder.

![Train a Custom AI Chatbot Using PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/566.jpg?w=534)

3\. Now, move back to the Terminal and type `cd`, add a space, and **paste the path** by right-clicking in the Terminal window. It will look something like below.

```
cd "C:\Users\mearj\Downloads\privateGPT-main"
```

![Train a Custom AI Chatbot Using PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/567.jpg?w=640)

4\. Next, hit Enter, and you will move to the **privateGPT-main** folder.

![Train a Custom AI Chatbot Using PrivateGPT](https://beebom.com/wp-content/uploads/2023/06/568.jpg?w=640)

5\. Once you are in the folder, run the below command, and it will start installing all the packages and dependencies. It might **take 10 to 15 minutes** to complete the process, so please keep patience. If you get any error, run the below command again and make sure Visual Studio is correctly installed along with the two components mentioned above.

```
pip3 install -r requirements.txt
```

![install privategpt](https://beebom.com/wp-content/uploads/2023/06/553.jpg?w=640)

6\. Once all the dependencies are installed, run the below command to create local embeddings and vectorstore. This process will take a few seconds **depending on the corpus of data** added to “source\_documents.” macOS and Linux users may have to use `python3` instead of `python` in the command below.

```
python ingest.py
```

![ingest.py](https://beebom.com/wp-content/uploads/2023/06/558.jpg?w=640)

7\. Finally, run PrivateGPT by executing the below command. You will be asked to **enter your query**. Enter your question and hit Enter.

```
python privateGPT.py
```

![How to Train a Custom AI Chatbot Using PrivateGPT Locally (Offline)](https://beebom.com/wp-content/uploads/2023/06/569.jpg?w=640)

8\. On my Intel 10th-gen i3-powered desktop PC, it took **close to 2 minutes** to answer a query. After every answer, it will also display four sources from where it has got the context.

![How to Train a Custom AI Chatbot Using PrivateGPT Locally (Offline)](https://beebom.com/wp-content/uploads/2023/06/572.jpg?w=640)

9\. To stop the conversation, type `**exit**` and hit Enter.

![How to Train a Custom AI Chatbot Using PrivateGPT Locally (Offline)](https://beebom.com/wp-content/uploads/2023/06/571.jpg?w=640)

You can also **turn off the internet**, but the private AI chatbot will still work since everything is being done locally. PrivateGPT does not have a web interface yet, so you will have to use it in the command-line interface for now. Also, it currently does not take advantage of the GPU, which is a bummer. Once GPU support is introduced, the performance will get much better. Finally, to load up the PrivateGPT AI chatbot, simply run `python privateGPT.py` if you have not added new documents to the source folder.

[1]: https://beebom.com/how-train-ai-chatbot-custom-knowledge-base-chatgpt-api/
[2]: https://beebom.com/how-train-ai-chatbot-using-privategpt-offline/#h-requirements-to-set-up-privategpt-on-your-pc
[3]: https://beebom.com/how-train-ai-chatbot-using-privategpt-offline/#h-set-up-the-environment-to-train-a-private-ai-chatbot
[4]: https://beebom.com/how-train-ai-chatbot-using-privategpt-offline/#h-how-to-set-up-privategpt-on-your-pc-locally
[5]: https://beebom.com/how-train-ai-chatbot-using-privategpt-offline/#h-train-a-custom-ai-chatbot-using-privategpt
[6]: https://github.com/imartinez/privateGPT
[7]: https://beebom.com/how-run-chatgpt-like-language-model-pc-offline/
[8]: https://www.python.org/downloads/
[9]: https://visualstudio.microsoft.com/downloads/
[10]: https://gpt4all.io/models/ggml-gpt4all-j-v1.3-groovy.bin
[11]: https://gpt4all.io/index.html
[12]: https://github.com/imartinez/privateGPT
[13]: https://github.com/imartinez/privateGPT/blob/main/source_documents/state_of_the_union.txt