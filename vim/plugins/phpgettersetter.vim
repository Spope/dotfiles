" Generate Getters Setters
map <leader>g <Plug>PhpgetsetInsertGetterSetter

" Getter Templates
let g:phpgetset_getterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * @return $%varname%\n" .
    \ "     */\n" .
    \ "    public function %funcname%()\n" .
    \ "    {\n" .
    \ "        return $this->%varname%;\n" .
    \ "    }"


" Setter Templates
let g:phpgetset_setterTemplate =
    \ "    \n" .
    \ "    /**\n" .
    \ "     * @param $%varname%\n" .
    \ "     */\n" .
    \ "    public function %funcname%($%varname%) : void\n" .
    \ "    {\n" .
    \ "        $this->%varname% = $%varname%;\n" .
    \ "    }"
