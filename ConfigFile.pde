//Elaborado por: Angel Palacios Mirafuentes
//10 de octubre de 2022
//controla el archivo de configuracion

class ConfigFile {
String file[];
String save;

int lang;
int ns;//numero de caracteres

ConfigFile()
{
    file = loadStrings("config.dat");
    loadConfig();
}

void loadConfig()
{
    for (int i = 0; i < file.length; ++i) {
        if (isData("language",i)) lang=loadData(i);
        if (isData("langstr",i)) ns=loadData(i);
    }
}

boolean isData(String s,int d)
{
    return split(file[d],'=')[0].equals("#"+s);
}

int loadData(int d)
{
    return int(split(file[d],'=')[1]);
}

void saveConfig(Idiomas i)
{
    lang = i.getIdioma();
    save="";
    addSave("language",lang);
    addSave("langstr",ns);
    file=split(save,';');
    saveStrings("data/config.dat",file);
}


void addSave (String s,int d)
{
    save=save+"#"+s+"="+d+";";

}


}