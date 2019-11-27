<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/> 

<!DOCTYPE html>
<html>
	<head>
		<title>My Articles</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<link href="/static/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/static/css/index.css" type="text/css" rel="stylesheet">		
	</head>
	<body><input type="hidden" value=<@security.authentication property="principal.uid"/> placeholder=<@security.authentication property="principal.username"/> id="u_id"/>
       <div class="navbar navbar-dark fixed-top flex-md-nowrap bg-dark p-0 shadow">
       		<span class="navbar-brand col-sm-3 col-md-2">Welcome, <@security.authentication property="principal.username"/>
       			<svg t="1573549665154" class="icon" viewBox="0 0 1202 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1316" xmlns:xlink="http://www.w3.org/1999/xlink" width="1.5em" height="2.5em">
       				<defs><style type="text/css"></style></defs>
       				<path d="M601.313737 947.451824m-76.485504 0a76.485504 76.485504 0 1 0 152.971008 0 76.485504 76.485504 0 1 0-152.971008 0Z" fill="#B10000" p-id="1317"></path>
       				<path d="M601.313737 934.17394a16.826811 16.826811 0 0 0-7.847413 31.695593v57.731259a77.479816 77.479816 0 0 0 15.710123 0v-57.77715a16.826811 16.826811 0 0 0-7.86271-31.649702zM608.68694 916.719948a362.54129 362.54129 0 0 0 60.347063-4.818587 76.485504 76.485504 0 0 0-133.987307-2.631101 342.349117 342.349117 0 0 0 73.640244 7.449688z" fill="#B10000" p-id="1318"></path>
       				<path d="M632.657497 281.874966c101.46567 7.556768 179.144348 94.842025 211.252962 185.09492 13.690905 38.487506 25.01076 82.956178 25.11784 123.906517 0 11.778768 9.698362 17.576369 17.056267 25.408484 33.745404 35.856404 56.461599 81.671221 50.771078 131.968089-7.495579 66.159961-52.147817 102.230525-111.867698 121.917894-135.28756 44.621643-281.466656 46.289027-415.499853-4.191406a31.71089 31.71089 0 0 1-9.39242-4.680912c-11.273963-10.707971-23.939963-19.73326-35.856405-29.691673-55.069563-45.891303-66.496497-117.787677-27.917209-178.241819 9.820739-15.373586 20.406333-30.227071 34.143129-42.403564 7.510877-6.654239 10.707971-14.654623 11.901145-24.475361 7.434391-61.387266 23.022137-120.434075 51.520635-175.687203 12.987239-25.179028 28.605579-48.49181 48.690672-68.638092a198.60226 198.60226 0 0 1 61.188404-44.988773c28.299637-13.660311 57.991309-17.591666 88.891453-15.297101zM420.150172 363.592078l-26.005072 31.022521c-15.205318 14.302789-31.206086 27.534782-50.939345 35.183332-39.09939 15.006456-72.722417 3.610116-103.056569-22.272579-4.895072-4.176109-9.331232-8.887616-13.966253-13.354369-0.565993-4.742101 3.1665-6.70013 6.11884-8.795833 20.406333-14.409869 40.950339-28.590281 62.809897-40.782071a99.431155 99.431155 0 0 1 15.2971-6.59305c9.851333-3.487739 19.029593-2.111 27.81013 3.365362 6.746021 4.191406 13.017833 9.055884 19.564992 13.553231 13.767391 9.468905 28.865629 10.799753 44.698128 7.220232 3.74779-0.856638 7.342608-2.095703 11.212775-0.979015z" fill="#B10000" p-id="1319"></path>
       				<path d="M816.696917 409.789323c-9.774847-11.350449-18.249441-24.154122-25.882695-35.810513q-2.95234-4.58913-5.767007-9.178261c2.967638-4.191406 5.828195-0.933123 7.770928 0.734261 17.606963 15.14413 38.349832 8.398108 57.318236 0 18.356521-8.122761 33.867781-14.761702 54.151737-8.780536 22.777383 6.715427 44.361592 20.651086 63.26881 34.709122 4.11492 3.05942 6.853101 7.143746 10.019601 10.952724 4.390268 5.2775-20.406333 22.624412-23.95526 25.071949-16.367898 11.258666-35.93289 20.023905-56.017984 20.849948-19.243753 0.780152-38.441614-5.659927-54.733026-15.51126a111.837104 111.837104 0 0 1-26.17334-23.037434z" fill="#B10000" p-id="1320"></path>
       				<path d="M977.622418 402.462012c-13.446152-8.795833-25.729724-19.304941-39.864245-27.106463-11.794065-6.516565-23.634021-12.773079-36.713042-16.444383-12.849565-3.594819-24.689521-2.049812-36.590665 3.53363-12.161195 5.705819-24.016448 12.08471-37.340223 15.159427-12.757782 2.95234-28.024289-0.94842-36.850716-11.013913-0.871935-0.994312-1.820355-2.141594-3.05942-2.218079-0.611884 0-1.239065 0.183565-1.85095 0.091782s-3.686601-5.017449-3.53363-5.201014c6.516565-8.015681 13.950956-15.450072 16.123144-26.142745 12.971942-2.432239 25.928586-4.864478 39.114687-5.690522 39.512411-2.47813 82.3137-0.856638 112.984387 27.534782q3.472442 3.212391 6.623645 6.761318a88.340757 88.340757 0 0 1 20.957028 40.73618zM418.10036 361.435187a48.950723 48.950723 0 0 1-16.658543 5.996464c-18.800137 2.891152-39.420629-4.32908-54.02936-16.046659-19.886231-16.000767-29.630484-16.398492-52.010143-3.53363a581.519289 581.519289 0 0 0-69.295866 46.334918c-3.334768-2.845261-0.458913-5.430471 0.627181-7.64855 17.071565-35.810513 51.000534-60.576519 89.931656-67.674374 17.301021-3.151203 34.709122-1.728572 52.086628-0.091783 15.297101 1.437927 52.576136 4.58913 59.352751 21.171188 3.885464 9.407717-2.00392 16.735028-10.004304 21.492426z" fill="#B10000" p-id="1321"></path>
       				<path d="M629.36862 280.804169c-30.456528-0.489507-61.188403-0.841341-91.262504 4.910369a192.972927 192.972927 0 0 0-43.734411 13.767391c-54.518867 24.811898-92.593351 77.082091-117.08401 129.489958a441.68849 441.68849 0 0 0-18.035282 44.912289 497.018104 497.018104 0 0 0-21.6301 93.312315c-3.05942 22.945651-10.187869 41.302172-27.01468 58.0372-34.892687 34.816202-54.396491 91.109533-37.56968 139.004756 18.861325 53.66223 83.981084 90.084627 136.34306 102.796517 0.994312 0.244754 7.159043 0.963717 7.464985 1.667384-1.239065-2.860558-19.702666-14.012144-21.95134-15.87839-17.285724-14.394572-35.978781-27.259434-49.715577-45.585361-32.812281-43.749708-38.380426-90.115221-13.476746-139.356588a208.040571 208.040571 0 0 1 45.187636-59.092701 20.834651 20.834651 0 0 0 7.220231-13.461449c1.759167-14.19571 3.961949-28.345528 6.394188-42.449455a501.622531 501.622531 0 0 1 37.799137-124.105379 323.457197 323.457197 0 0 1 55.620258-84.975395l11.625797-10.707971a194.12021 194.12021 0 0 1 137.092618-51.291179 11.686985 11.686985 0 0 0-3.27358-0.994311zM641.560409 467.612364a64.890302 64.890302 0 0 1 18.20355-36.4071 62.993461 62.993461 0 0 1 68.087396-13.29318 62.198012 62.198012 0 0 1 27.274731 21.415941 62.901679 62.901679 0 0 1-62.94757 98.268576 61.739099 61.739099 0 0 1-35.382194-20.375739c-10.830347-12.528326-17.056267-28.330231-15.771311-44.896991q0.183565-2.386348 0.535398-4.711507z" fill="#B10000" p-id="1322"></path><path d="M561.265927 483.322487a61.004838 61.004838 0 0 1-5.292797 18.815434c-13.767391 29.615187-49.134288 43.933274-79.667301 32.65931-26.219231-9.683065-42.05173-34.724419-40.170187-63.574751 1.973326-30.242368 25.454376-52.331382 54.289411-58.128983 23.725803-4.757398 50.480433 11.472826 62.289795 31.389651a62.075635 62.075635 0 0 1 8.551079 38.839339z" fill="#B10000" p-id="1323"></path><path d="M507.098893 480.048907m-37.753245 0a37.753245 37.753245 0 1 0 75.50649 0 37.753245 37.753245 0 1 0-75.50649 0Z" fill="#B10000" p-id="1324"></path>
       				<path d="M694.993183 480.048907m-37.753245 0a37.753245 37.753245 0 1 0 75.50649 0 37.753245 37.753245 0 1 0-75.50649 0Z" fill="#B10000" p-id="1325"></path>
       				<path d="M597.871889 824.876154a256.149954 256.149954 0 0 1-39.894839-4.130217 89.686902 89.686902 0 0 1-47.421012-24.031745c-26.005071-25.37789-29.064492-72.661229-19.396724-105.855938 4.58913-15.786608 13.492043-30.594202 26.724035-40.384346 14.501652-10.707971 32.888767-14.501652 50.786375-16.536166a273.083844 273.083844 0 0 1 77.571598 1.682681c21.828963 3.793681 45.386498 12.405949 57.042889 32.55223a97.901445 97.901445 0 0 1 12.543623 40.690289c2.462833 28.988006-2.187485 62.718113-22.639709 84.745938a90.574134 90.574134 0 0 1-43.336687 25.653238 190.816036 190.816036 0 0 1-51.979549 5.614036z" fill="#B10000" p-id="1326"></path>
       				<path d="M598.499071 807.483351a209.968006 209.968006 0 0 1-32.705202-3.334768 73.517867 73.517867 0 0 1-38.854636-19.702666c-21.308861-20.804057-23.771695-59.551614-15.893688-86.765156 3.74779-12.941347 11.059804-25.11784 21.905448-33.102926 11.885847-8.749942 26.968789-11.885847 41.638709-13.553232a223.857774 223.857774 0 0 1 63.574751 1.376739c17.897608 3.05942 37.202549 10.172572 46.763237 26.678144a80.217997 80.217997 0 0 1 10.279652 33.34768c2.019217 23.756398-1.789761 51.44415-18.555383 69.464135a74.23683 74.23683 0 0 1-35.56576 21.00292 156.412856 156.412856 0 0 1-42.587128 4.58913z" fill="#B10000" p-id="1327"></path><path d="M580.111955 674.123226c7.235529-7.235529 2.294565-17.163347-2.340456-23.496347-1.070797 0.10708-2.126297 0.198862-3.197094 0.321239-14.66992 1.667384-29.737564 4.80329-41.638709 13.553231-10.845644 7.985087-18.172956 20.161579-21.905448 33.102926-7.878007 27.213542-5.415174 65.961099 15.893688 86.765156a71.605729 71.605729 0 0 0 21.783071 14.547543c-0.321239-12.405949-13.323775-48.614186-12.390651-70.504337 1.193174-27.504187 32.338071-42.785991 43.795599-54.289411zM0.137674 73.451967C-1.468522 37.090758 26.356905 17.112744 50.816969 28.799729s13.155507 82.176026 21.415941 112.647851 38.594585 20.68168 55.329614 18.998999-2.891152-21.324159-6.11884-57.532396 32.475745-30.884847 49.960331-5.06334a4.58913 4.58913 0 0 0 8.382811-3.059421c-0.795449-7.801521-1.52971-16.490275-2.355753-26.586361-4.099623-49.945034 33.087629-79.055417 67.307243-64.416091s22.333767 112.28072 35.275115 153.705269 54.090549 26.203934 77.020903 22.945651-5.078637-29.171571-11.411638-78.795366 43.00015-44.361592 68.393338-9.912522c14.792297 20.100391 22.471441 47.283339 30.701282 70.473744 18.585978 52.377273 31.297868 106.223068 48.445918 158.982769 3.763087 11.595202 5.828195 22.807977-2.600507 32.812281-7.235529 8.596971-18.631869 13.124913-29.278651 15.756014-18.78484 4.58913-35.504571 5.078637-47.711658-12.08471-8.245137-11.595202-10.187869-33.837187-10.034898-47.665766 0-6.409485 0.504804-13.262586-1.330847-19.488506-5.2775-17.928202-27.733644-16.30671-42.571832-14.547543-61.647316 7.312014-97.289561-6.424782-119.822191-27.901912a4.32908 4.32908 0 0 0-1.315551-0.871935c-24.475361-10.264355-62.932273-20.987622-111.668836-17.316318-85.877924 6.470674-100.838489-39.772462-112.540771-74.328613S1.667384 109.828473 0.137674 73.451967zM1202.4898 73.451967c1.606196-36.361209-26.219231-56.339222-50.679295-44.652238s-13.155507 82.176026-21.415941 112.647851-38.594585 20.68168-55.329614 18.998999 2.891152-21.324159 6.118841-57.532396-32.475745-30.884847-49.960332-5.06334a4.58913 4.58913 0 0 1-8.382811-3.059421c0.795449-7.801521 1.52971-16.490275 2.355754-26.586361 4.099623-49.945034-33.087629-79.055417-67.307244-64.416091s-22.333767 112.28072-35.275115 153.705269-54.090549 26.203934-77.020902 22.945651 5.078637-29.171571 11.411637-78.795366-43.00015-44.361592-68.393338-9.912522c-14.792297 20.100391-22.471441 47.283339-30.701282 70.473744-18.585978 52.377273-31.297868 106.223068-48.445918 158.982769-3.763087 11.595202-5.828195 22.807977 2.600507 32.812281 7.235529 8.596971 18.631869 13.124913 29.278651 15.756014 18.78484 4.58913 35.504571 5.078637 47.711658-12.08471 8.245137-11.595202 10.187869-33.837187 10.034898-47.665766 0-6.409485-0.504804-13.262586 1.330848-19.488506 5.2775-17.928202 27.733644-16.30671 42.571831-14.547543 61.647316 7.312014 97.289561-6.424782 119.822191-27.901912a4.32908 4.32908 0 0 1 1.315551-0.871935c24.475361-10.264355 62.932273-20.987622 111.668836-17.316318 85.877924 6.470674 100.838489-39.772462 112.540771-74.328613s12.620108-45.723034 14.149818-82.09954z" fill="#B10000" p-id="1328"></path>
       				<path d="M601.313737 947.451824m-76.485504 0a76.485504 76.485504 0 1 0 152.971008 0 76.485504 76.485504 0 1 0-152.971008 0Z" fill="#FFDA00" p-id="1329"></path>
       				<path d="M601.313737 934.17394a16.826811 16.826811 0 0 0-7.847413 31.695593v57.731259a77.479816 77.479816 0 0 0 15.710123 0v-57.77715a16.826811 16.826811 0 0 0-7.86271-31.649702z" fill="#5B5B5B" p-id="1330"></path>
       				<path d="M608.68694 916.719948a362.54129 362.54129 0 0 0 60.347063-4.818587 76.485504 76.485504 0 0 0-133.987307-2.631101 342.349117 342.349117 0 0 0 73.640244 7.449688z" fill="#F4CB00" p-id="1331"></path>
       				<path d="M632.657497 281.874966c101.46567 7.556768 179.144348 94.842025 211.252962 185.09492 13.690905 38.487506 25.01076 82.956178 25.11784 123.906517 0 11.778768 9.698362 17.576369 17.056267 25.408484 33.745404 35.856404 56.461599 81.671221 50.771078 131.968089-7.495579 66.159961-52.147817 102.230525-111.867698 121.917894-135.28756 44.621643-281.466656 46.289027-415.499853-4.191406a31.71089 31.71089 0 0 1-9.39242-4.680912c-11.273963-10.707971-23.939963-19.73326-35.856405-29.691673-55.069563-45.891303-66.496497-117.787677-27.917209-178.241819 9.820739-15.373586 20.406333-30.227071 34.143129-42.403564 7.510877-6.654239 10.707971-14.654623 11.901145-24.475361 7.434391-61.387266 23.022137-120.434075 51.520635-175.687203 12.987239-25.179028 28.605579-48.49181 48.690672-68.638092a198.60226 198.60226 0 0 1 61.188404-44.988773c28.299637-13.660311 57.991309-17.591666 88.891453-15.297101z" fill="#D69C63" p-id="1332"></path><path d="M420.150172 363.592078l-26.005072 31.022521c-15.205318 14.302789-31.206086 27.534782-50.939345 35.183332-39.09939 15.006456-72.722417 3.610116-103.056569-22.272579-4.895072-4.176109-9.331232-8.887616-13.966253-13.354369-0.565993-4.742101 3.1665-6.70013 6.11884-8.795833 20.406333-14.409869 40.950339-28.590281 62.809897-40.782071a99.431155 99.431155 0 0 1 15.2971-6.59305c9.851333-3.487739 19.029593-2.111 27.81013 3.365362 6.746021 4.191406 13.017833 9.055884 19.564992 13.553231 13.767391 9.468905 28.865629 10.799753 44.698128 7.220232 3.74779-0.856638 7.342608-2.095703 11.212775-0.979015zM816.696917 409.789323c-9.774847-11.350449-18.249441-24.154122-25.882695-35.810513q-2.95234-4.58913-5.767007-9.178261c2.967638-4.191406 5.828195-0.933123 7.770928 0.734261 17.606963 15.14413 38.349832 8.398108 57.318236 0 18.356521-8.122761 33.867781-14.761702 54.151737-8.780536 22.777383 6.715427 44.361592 20.651086 63.26881 34.709122 4.11492 3.05942 6.853101 7.143746 10.019601 10.952724 4.390268 5.2775-20.406333 22.624412-23.95526 25.071949-16.367898 11.258666-35.93289 20.023905-56.017984 20.849948-19.243753 0.780152-38.441614-5.659927-54.733026-15.51126a111.837104 111.837104 0 0 1-26.17334-23.037434z" fill="#EFCA95" p-id="1333"></path><path d="M977.622418 402.462012c-13.446152-8.795833-25.729724-19.304941-39.864245-27.106463-11.794065-6.516565-23.634021-12.773079-36.713042-16.444383-12.849565-3.594819-24.689521-2.049812-36.590665 3.53363-12.161195 5.705819-24.016448 12.08471-37.340223 15.159427-12.757782 2.95234-28.024289-0.94842-36.850716-11.013913-0.871935-0.994312-1.820355-2.141594-3.05942-2.218079-0.611884 0-1.239065 0.183565-1.85095 0.091782s-3.686601-5.017449-3.53363-5.201014c6.516565-8.015681 13.950956-15.450072 16.123144-26.142745 12.971942-2.432239 25.928586-4.864478 39.114687-5.690522 39.512411-2.47813 82.3137-0.856638 112.984387 27.534782q3.472442 3.212391 6.623645 6.761318a88.340757 88.340757 0 0 1 20.957028 40.73618zM418.10036 361.435187a48.950723 48.950723 0 0 1-16.658543 5.996464c-18.800137 2.891152-39.420629-4.32908-54.02936-16.046659-19.886231-16.000767-29.630484-16.398492-52.010143-3.53363a581.519289 581.519289 0 0 0-69.295866 46.334918c-3.334768-2.845261-0.458913-5.430471 0.627181-7.64855 17.071565-35.810513 51.000534-60.576519 89.931656-67.674374 17.301021-3.151203 34.709122-1.728572 52.086628-0.091783 15.297101 1.437927 52.576136 4.58913 59.352751 21.171188 3.885464 9.407717-2.00392 16.735028-10.004304 21.492426z" fill="#D69C63" p-id="1334"></path><path d="M629.36862 280.804169c-30.456528-0.489507-61.188403-0.841341-91.262504 4.910369a192.972927 192.972927 0 0 0-43.734411 13.767391c-54.518867 24.811898-92.593351 77.082091-117.08401 129.489958a441.68849 441.68849 0 0 0-18.035282 44.912289 497.018104 497.018104 0 0 0-21.6301 93.312315c-3.05942 22.945651-10.187869 41.302172-27.01468 58.0372-34.892687 34.816202-54.396491 91.109533-37.56968 139.004756 18.861325 53.66223 83.981084 90.084627 136.34306 102.796517 0.994312 0.244754 7.159043 0.963717 7.464985 1.667384-1.239065-2.860558-19.702666-14.012144-21.95134-15.87839-17.285724-14.394572-35.978781-27.259434-49.715577-45.585361-32.812281-43.749708-38.380426-90.115221-13.476746-139.356588a208.040571 208.040571 0 0 1 45.187636-59.092701 20.834651 20.834651 0 0 0 7.220231-13.461449c1.759167-14.19571 3.961949-28.345528 6.394188-42.449455a501.622531 501.622531 0 0 1 37.799137-124.105379 323.457197 323.457197 0 0 1 55.620258-84.975395l11.625797-10.707971a194.12021 194.12021 0 0 1 137.092618-51.291179 11.686985 11.686985 0 0 0-3.27358-0.994311z" fill="#C99250" p-id="1335"></path><path d="M641.560409 467.612364a64.890302 64.890302 0 0 1 18.20355-36.4071 62.993461 62.993461 0 0 1 68.087396-13.29318 62.198012 62.198012 0 0 1 27.274731 21.415941 62.901679 62.901679 0 0 1-62.94757 98.268576 61.739099 61.739099 0 0 1-35.382194-20.375739c-10.830347-12.528326-17.056267-28.330231-15.771311-44.896991q0.183565-2.386348 0.535398-4.711507zM561.265927 483.322487a61.004838 61.004838 0 0 1-5.292797 18.815434c-13.767391 29.615187-49.134288 43.933274-79.667301 32.65931-26.219231-9.683065-42.05173-34.724419-40.170187-63.574751 1.973326-30.242368 25.454376-52.331382 54.289411-58.128983 23.725803-4.757398 50.480433 11.472826 62.289795 31.389651a62.075635 62.075635 0 0 1 8.551079 38.839339z" fill="#FDFDFD" p-id="1336"></path>
       				<path d="M507.098893 480.048907m-37.753245 0a37.753245 37.753245 0 1 0 75.50649 0 37.753245 37.753245 0 1 0-75.50649 0Z" fill="#3A220C" p-id="1337"></path>
       				<path d="M694.993183 480.048907m-37.753245 0a37.753245 37.753245 0 1 0 75.50649 0 37.753245 37.753245 0 1 0-75.50649 0Z" fill="#3A220C" p-id="1338"></path><path d="M597.871889 824.876154a256.149954 256.149954 0 0 1-39.894839-4.130217 89.686902 89.686902 0 0 1-47.421012-24.031745c-26.005071-25.37789-29.064492-72.661229-19.396724-105.855938 4.58913-15.786608 13.492043-30.594202 26.724035-40.384346 14.501652-10.707971 32.888767-14.501652 50.786375-16.536166a273.083844 273.083844 0 0 1 77.571598 1.682681c21.828963 3.793681 45.386498 12.405949 57.042889 32.55223a97.901445 97.901445 0 0 1 12.543623 40.690289c2.462833 28.988006-2.187485 62.718113-22.639709 84.745938a90.574134 90.574134 0 0 1-43.336687 25.653238 190.816036 190.816036 0 0 1-51.979549 5.614036z" fill="#FFFFFF" p-id="1339"></path><path d="M598.499071 807.483351a209.968006 209.968006 0 0 1-32.705202-3.334768 73.517867 73.517867 0 0 1-38.854636-19.702666c-21.308861-20.804057-23.771695-59.551614-15.893688-86.765156 3.74779-12.941347 11.059804-25.11784 21.905448-33.102926 11.885847-8.749942 26.968789-11.885847 41.638709-13.553232a223.857774 223.857774 0 0 1 63.574751 1.376739c17.897608 3.05942 37.202549 10.172572 46.763237 26.678144a80.217997 80.217997 0 0 1 10.279652 33.34768c2.019217 23.756398-1.789761 51.44415-18.555383 69.464135a74.23683 74.23683 0 0 1-35.56576 21.00292 156.412856 156.412856 0 0 1-42.587128 4.58913z" fill="#C70000" p-id="1340"></path><path d="M580.111955 674.123226c7.235529-7.235529 2.294565-17.163347-2.340456-23.496347-1.070797 0.10708-2.126297 0.198862-3.197094 0.321239-14.66992 1.667384-29.737564 4.80329-41.638709 13.553231-10.845644 7.985087-18.172956 20.161579-21.905448 33.102926-7.878007 27.213542-5.415174 65.961099 15.893688 86.765156a71.605729 71.605729 0 0 0 21.783071 14.547543c-0.321239-12.405949-13.323775-48.614186-12.390651-70.504337 1.193174-27.504187 32.338071-42.785991 43.795599-54.289411z" fill="#B10000" p-id="1341"></path><path d="M0.137674 73.451967C-1.468522 37.090758 26.356905 17.112744 50.816969 28.799729s13.155507 82.176026 21.415941 112.647851 38.594585 20.68168 55.329614 18.998999-2.891152-21.324159-6.11884-57.532396 32.475745-30.884847 49.960331-5.06334a4.58913 4.58913 0 0 0 8.382811-3.059421c-0.795449-7.801521-1.52971-16.490275-2.355753-26.586361-4.099623-49.945034 33.087629-79.055417 67.307243-64.416091s22.333767 112.28072 35.275115 153.705269 54.090549 26.203934 77.020903 22.945651-5.078637-29.171571-11.411638-78.795366 43.00015-44.361592 68.393338-9.912522c14.792297 20.100391 22.471441 47.283339 30.701282 70.473744 18.585978 52.377273 31.297868 106.223068 48.445918 158.982769 3.763087 11.595202 5.828195 22.807977-2.600507 32.812281-7.235529 8.596971-18.631869 13.124913-29.278651 15.756014-18.78484 4.58913-35.504571 5.078637-47.711658-12.08471-8.245137-11.595202-10.187869-33.837187-10.034898-47.665766 0-6.409485 0.504804-13.262586-1.330847-19.488506-5.2775-17.928202-27.733644-16.30671-42.571832-14.547543-61.647316 7.312014-97.289561-6.424782-119.822191-27.901912a4.32908 4.32908 0 0 0-1.315551-0.871935c-24.475361-10.264355-62.932273-20.987622-111.668836-17.316318-85.877924 6.470674-100.838489-39.772462-112.540771-74.328613S1.667384 109.828473 0.137674 73.451967zM1202.4898 73.451967c1.606196-36.361209-26.219231-56.339222-50.679295-44.652238s-13.155507 82.176026-21.415941 112.647851-38.594585 20.68168-55.329614 18.998999 2.891152-21.324159 6.118841-57.532396-32.475745-30.884847-49.960332-5.06334a4.58913 4.58913 0 0 1-8.382811-3.059421c0.795449-7.801521 1.52971-16.490275 2.355754-26.586361 4.099623-49.945034-33.087629-79.055417-67.307244-64.416091s-22.333767 112.28072-35.275115 153.705269-54.090549 26.203934-77.020902 22.945651 5.078637-29.171571 11.411637-78.795366-43.00015-44.361592-68.393338-9.912522c-14.792297 20.100391-22.471441 47.283339-30.701282 70.473744-18.585978 52.377273-31.297868 106.223068-48.445918 158.982769-3.763087 11.595202-5.828195 22.807977 2.600507 32.812281 7.235529 8.596971 18.631869 13.124913 29.278651 15.756014 18.78484 4.58913 35.504571 5.078637 47.711658-12.08471 8.245137-11.595202 10.187869-33.837187 10.034898-47.665766 0-6.409485-0.504804-13.262586 1.330848-19.488506 5.2775-17.928202 27.733644-16.30671 42.571831-14.547543 61.647316 7.312014 97.289561-6.424782 119.822191-27.901912a4.32908 4.32908 0 0 1 1.315551-0.871935c24.475361-10.264355 62.932273-20.987622 111.668836-17.316318 85.877924 6.470674 100.838489-39.772462 112.540771-74.328613s12.620108-45.723034 14.149818-82.09954z" fill="#210E01" p-id="1342"></path>
       			</svg>
       		</span>
       		 <ul class="navbar-nav px-3">
    				<li class="nav-item text-nowrap">
      					<a class="nav-link" href="#">Sign out</a>
    				</li>
  			 </ul>
       </div>
       <!-- container -->
       <div class="container-fluid" style="margin-top:3.5em;">
       		<div class="row" style="min-height:28em;">
       			<!--左侧导航列表区-->
  				<div class="col-3">
    				<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      					<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
      						<svg t="1573623629719" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5502" width="1.5em" height="1.5em">
      							<path d="M746.666667 810.666667v-202.645334a138.24 138.24 0 0 0 64 10.24V810.666667a64 64 0 0 1-64 64h-192v-149.333334h-64v149.333334h-192a64 64 0 0 1-64-64v-195.712a139.050667 139.050667 0 0 0 64 0V810.666667h128v-149.333334h192v149.333334h128v-202.645334z m-21.013334-618.666667a64 64 0 0 1 54.976 31.253333l101.76 170.837334-0.277333-0.021334a110.72 110.72 0 0 1-182.08 122.965334 120.298667 120.298667 0 0 1-87.765333 37.824 120.469333 120.469333 0 0 1-90.581334-40.896 120.469333 120.469333 0 0 1-90.56 40.896 120.426667 120.426667 0 0 1-87.765333-37.824 110.72 110.72 0 0 1-175.786667-133.76l85.568-157.781334A64 64 0 0 1 309.397333 192h416.256z m0 64H309.397333l-86.912 160.213333-1.493333 2.304a46.72 46.72 0 0 0 74.197333 56.384l46.314667-52.970666 48.362667 51.136c10.688 11.328 25.386667 17.792 41.258666 17.792 16.554667 0 31.829333-7.04 42.581334-19.242667l48-54.357333 47.978666 54.357333c10.752 12.202667 26.026667 19.242667 42.581334 19.242667 15.872 0 30.549333-6.464 41.216-17.749334l48.32-51.2 46.378666 52.970667a46.72 46.72 0 0 0 76.864-51.818667l-0.725333-1.429333L725.653333 256z" p-id="5503"></path>
      						</svg>
      						Home
      					</a>
      					<a class="nav-link" id="v-pills-articles-tab" data-toggle="pill" href="#v-pills-articles" role="tab" aria-controls="v-pills-articles" aria-selected="false">
      						<svg t="1573623541202" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5384" width="1.5em" height="1.5em">
      							<path d="M256 734.101333v64H170.666667v-64h85.333333z m597.333333 0v64H298.666667v-64h554.666666zM256 493.184v64H170.666667v-64h85.333333z m597.333333 0v64H298.666667v-64h554.666666zM256 252.245333v64H170.666667v-64h85.333333z m597.333333 0v64H298.666667v-64h554.666666z" p-id="5385"></path>
      						</svg>
      						Article List
      					</a>
      					<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
      						<svg t="1573622907789" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4912" width="1.5em" height="1.5em">
      							<path d="M789.333333 170.666667a64 64 0 0 1 64 64v554.666666a64 64 0 0 1-64 64H234.666667a64 64 0 0 1-64-64V234.666667a64 64 0 0 1 64-64h554.666666z m0 64H234.666667v554.666666h554.666666V234.666667z m-42.666666 384v64H277.333333v-64h469.333334zM469.333333 320a64 64 0 0 1 64 64v106.666667a64 64 0 0 1-64 64h-128a64 64 0 0 1-64-64v-106.666667a64 64 0 0 1 64-64h128z m277.333334 170.666667v64h-170.666667v-64h170.666667z m-277.333334-106.666667h-128v106.666667h128v-106.666667z" p-id="4913"></path>
      						</svg>
      						Profile
      					</a>
      					<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">
      						<svg t="1573623238097" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5030" width="1.5em" height="1.5em">
      							<path d="M448.362667 166.826667l113.6 0.170666a64 64 0 0 1 63.893333 63.914667l0.042667 18.517333a301.461333 301.461333 0 0 1 62.101333 34.88l15.210667-8.746666a64 64 0 0 1 87.296 23.381333l56.938666 98.304a64 64 0 0 1-19.989333 85.397333l-3.477333 2.133334-15.274667 8.810666c2.624 24.234667 2.304 48.853333-1.130667 73.322667l10.794667 6.250667a64 64 0 0 1 25.216 84.117333l-1.770667 3.306667-53.333333 92.373333a64 64 0 0 1-84.117333 25.216l-3.328-1.792-14.741334-8.533333a298.538667 298.538667 0 0 1-59.626666 33.28v25.386666a64 64 0 0 1-59.989334 63.957334l-4.074666 0.128-113.6-0.170667a64 64 0 0 1-63.893334-63.893333l-0.064-30.613334a302.613333 302.613333 0 0 1-50.069333-29.696l-27.221333 15.658667a64 64 0 0 1-87.296-23.402667l-56.938667-98.282666a64 64 0 0 1 19.989333-85.418667l3.477334-2.133333 27.690666-15.936c-2.133333-20.266667-2.24-40.768-0.192-61.226667l-30.741333-17.770667A64 64 0 0 1 158.506667 393.6l1.792-3.306667 53.333333-92.373333a64 64 0 0 1 84.117333-25.216l3.306667 1.792 26.794667 15.466667a297.984 297.984 0 0 1 56.426666-34.666667v-24.362667a64 64 0 0 1 59.989334-63.978666l4.074666-0.128z m-0.085334 64l0.064 65.066666-36.778666 17.301334c-15.744 7.402667-30.613333 16.533333-44.309334 27.221333l-34.005333 26.538667-62.570667-36.138667-1.6-0.896-53.333333 92.373333 66.56 38.421334-4.138667 41.152c-1.6 15.978667-1.536 32.106667 0.149334 48.085333l4.394666 41.429333-63.786666 36.736 56.917333 98.282667 63.338667-36.416 33.6 24.597333a237.994667 237.994667 0 0 0 39.466666 23.424l36.736 17.258667 0.128 71.168 113.578667 0.170667-0.064-68.16 39.466667-16.426667a234.538667 234.538667 0 0 0 46.826666-26.112l33.578667-24.128 50.56 29.184 53.290667-92.394667-48.128-27.818666 5.973333-42.688c2.666667-19.093333 2.965333-38.421333 0.896-57.6l-4.48-41.450667 51.456-29.696-56.938667-98.282667-51.2 29.504-33.621333-24.512a238.037333 238.037333 0 0 0-48.938667-27.498666l-39.381333-16.341334-0.128-61.184-113.578667-0.170666z m127.381334 183.722666a128.170667 128.170667 0 0 1 46.890666 174.933334 127.829333 127.829333 0 0 1-174.762666 46.848 128.170667 128.170667 0 0 1-46.869334-174.933334 127.829333 127.829333 0 0 1 174.741334-46.848z m-119.317334 78.805334a64.170667 64.170667 0 0 0 23.466667 87.573333 63.829333 63.829333 0 0 0 87.296-23.402667 64.170667 64.170667 0 0 0-20.266667-85.589333l-3.2-1.984-3.306666-1.770667a63.829333 63.829333 0 0 0-83.989334 25.173334z" p-id="5031"></path>
      						</svg>
      						Settings
      					</a>
    				</div>
  				</div>
  			<!--右侧内容区域-->
  			<div class="col-9">
    			<div class="tab-content" id="v-pills-tabContent">
      				<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">欢迎信息，文章数量统计等</div>
      				<div class="tab-pane fade" id="v-pills-articles" role="tabpanel" aria-labelledby="v-pills-articles-tab">
      					<nav aria-label="breadcrumb">
  							<ol class="breadcrumb">
    							<li class="breadcrumb-item active" aria-current="page">文章列表</li>
  							</ol>
						</nav>
						<div class="row justify-content-end">
							<div class="col-2" style="margin-bottom:1rem; text-align:center;">
								<button type="button" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-xl" onclick="getCategory();">撰写文章</button>
							</div>
						</div>
      					<table id="article_table" class="table">
      						<thead class="thead-dark">
      							<tr>
      								<th scope="col">#</th>
      								<th scope="col">标题</th>
      								<th scope="col">作者</th>
      								<th scope="col">分类</th>
      								<th scope="col">日期</th>
      								<th scope="col">操作</th>
    							</tr>
      						</thead>
      						<tbody>
      							
      						</tbody>
      					</table>
      					
      					<nav aria-label="...">
      						<ul id="idx_pagination" class="pagination justify-content-center">
    							
  							</ul>
      					</nav>
      					
      					
      				</div>
      				
      				<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">个人信息</div>
      				<div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">系统设置</div>
    			</div>
  			</div>
		</div>
       		
       		
       </div>
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
<!--编辑器-->
<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    	<div class="modal-header">
        	
        	<div class="input-group">
        		<div class="input-group-prepend">
    				<span class="input-group-text">文章标题</span>
  				</div>
  				<input type="text" aria-label="Article title" id="article_title" class="form-control">
        	</div>
        	<!--
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          		<span aria-hidden="true">&times;</span>
        	</button>-->
      	</div>
      	
        <div class="modal-body">
      		<form>
				<textarea name="editor1" id="editor1" rows="100" cols="80"></textarea>
	  		</form>
	  	</div>
    
    
    	<div class="modal-footer">
    		<!--文章分类-->
    		<div class="col-md-4">
    			<select class="form-control" id="article_cat">
    				<option value="0">文章分类</option>
    			</select>
    		</div>
    		<div class="col-md-4"></div>
    		<div class="col-md-4"  style="text-align:right;">
       			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       			<button type="button" class="btn btn-primary" onclick="getArticleData();">Save article</button>
       		</div>
    	</div>  
    </div>
  </div>
</div>       
       

<#-- 通知用的modal -->
<div class="modal" tabindex="-1" role="dialog" id="info_model">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Info</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
    </div>
  </div>
</div>       
       
       
       
       
       
        
		<script type="text/javascript" src="/static/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="/static/bootstrap/bootstrap.js"></script>
		<script type="text/javascript" src="/static/js/index.js"></script>
		<script type="text/javascript">                  
            CKEDITOR.replace( 'editor1',{
            	height:360
            });
            
           
        </script>
	</body>
</html>