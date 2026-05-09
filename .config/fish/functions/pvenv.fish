function pvenv --argument venv_name
    # Si no das nombre, usa .venv por defecto
    if test -z "$venv_name"
        set venv_name .venv
    end

    if test -d "./$venv_name"
        source "./$venv_name/bin/activate.fish"
    else
        echo "Creando entorno virtual: $venv_name"
        python3 -m venv "$venv_name"
        source "./$venv_name/bin/activate.fish"
    end
end
