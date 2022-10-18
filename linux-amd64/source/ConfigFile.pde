//Elaborado por: Angel Palacios Mirafuentes
//10 de octubre de 2022
//controla el archivo de configuracion

class ConfigFile {
String file[];
String save;

int lang;
int ns;//numero de caracteres

int velocidadHorizontalFondo;
int velocidadVerticalFondo;

int velocidadHorizontalFrente;
int velocidadVerticalFrente;

int velocidadHorizontalAscendentePersonaje;
int velocidadVerticalAscendentePersonaje;

int velocidadHorizontalDescendenteFrente;
int velocidadVerticalDescendenteFrente;

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
        if (isData("velocidadHorizontalFondo",i)) velocidadHorizontalFondo=loadData(i);
        if (isData("velocidadVerticalFondo",i)) velocidadVerticalFondo=loadData(i);

        if (isData("velocidadHorizontalFrente",i)) velocidadHorizontalFrente=loadData(i);
        if (isData("velocidadVerticalFrente",i)) velocidadVerticalFrente=loadData(i);

        if (isData("velocidadHorizontalAscendentePersonaje",i)) velocidadHorizontalAscendentePersonaje=loadData(i);
        if (isData("velocidadVerticalAscendentePersonaje",i)) velocidadVerticalAscendentePersonaje=loadData(i);

        if (isData("velocidadHorizontalDescendenteFrente",i)) velocidadHorizontalDescendenteFrente=loadData(i);
        if (isData("velocidadVerticalDescendenteFrente",i)) velocidadVerticalDescendenteFrente=loadData(i);
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
    addSave("velocidadHorizontalFondo",velocidadHorizontalFondo);
    addSave("velocidadVerticalFondo",velocidadVerticalFondo);

    addSave("velocidadHorizontalFrente",velocidadHorizontalFrente);
    addSave("velocidadVerticalFrente",velocidadVerticalFrente);

    addSave("velocidadHorizontalAscendentePersonaje",velocidadHorizontalAscendentePersonaje);
    addSave("velocidadVerticalAscendentePersonaje",velocidadVerticalAscendentePersonaje);
    file=split(save,';');
    saveStrings("data/config.dat",file);
}


void addSave (String s,int d)
{
    save=save+"#"+s+"="+d+";";

}


}
