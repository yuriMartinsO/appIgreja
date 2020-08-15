
grupos_de_notas = 
  {
  [1] = { 'do','do#','1do','1do#', } ,
  [2] = { 're','re#','1re','1re#','reb','1reb' },
  [3] = { 'mi','mi#','1mi','1mi#','mib','1mib' },
  [4] = { 'fa','fa#','1fa','1fa#' },
  [5] = { 'sol','sol#','1sol','1sol#','solb','1solb' },
  [6] = { 'la','la#','1la','1la#', 'lab','1lab'},
  [7] = { 'si','si#','1si','1si#','sib','0si','0sib', },
  }


hinos = {}
--talvez este comando seja DESNECESSARIO

lista_hinos = {1,58,440,454,463,473,480}

hinos[1] = 
    {
    'sol','sol', 'sol', 'sib', 'sib', 'mib', 'lab', 'lab', 'sol', '1do', '1do', '1do','sib', 'sol', 'sol', 'sol', 'fa', 'fa', 'fa', 'sol', 'sol', 'sol', 'sib' ,'sib','1do', '1re', '1mib', '1re', '1mib', '1re', '1do', 'sib', 'sol', 'sib', 'sib', 'sib', 'lab', 'sol', '1do', '1re', '1mib', '1mib', 'mib', 'fa', 'sol', 'sol', 'fa', 'mib'
    }



hinos[58] = 
    {
    'la','fa#','mi','re','la','si','sol','sol','si','la','fa#','fa#','mi','re','fa#','fa#','mi',
    'la','fa#','mi','re','la','si','sol','1re','1do#','si','la','fa#','fa#','mi','re','mi','fa#','mi','re',
    'la','la','1re','1do#','1mi','1re','1do#','si','la','si','la','fa#','fa#','mi','re','mi','fa#','fa#','mi',
    'la','la','1re','1do#','1mi','1re','1do#','si','la','si','la','fa#','fa#','mi','re','mi','fa#','mi','re'
    } 
  

  
hinos[440] = 
  {
  
  'do','la','sol#','la','1do','la','sib','la','sol','sol','re','mi','fa','sol','la','sib','1do','1mi','1re',
  '1do','do','la','sol#','la','1do','la','sib','la','sol','sol','re',
  '1do','si','sib','sol','re','mi','fa','do','re','mi','fa','do','la','sib','la',
  'sol','re','do#','re','fa','mi','sol','re','mi','do','do','re','mi',
  'fa','do','la','sib','la','sol','re','mi','fa','sol','la','do','sol','la','fa',
  }

hinos[454] = 
    {
    'si','la','sol','sol','mi','re','sol','si','si','la','si','la','sol',
    'sol','mi','re','sol','fa#','la','la','sol','1re','1mi','1re','1re','si','1re',
    '1re','1mi','1re','1re','si','la','si','la','sol','sol','mi','re','sol','fa#','la','sol',
    }
  
hinos[463] =
  {
    'mib','fa','mib','fa','mib','1do','lab','sol','fa','lab','sol','mib','fa',
    'mib','fa','mib','1reb','1do','sib','lab','sib','1do','mib','fa','mib','fa','mib','1do',
    'lab','lab','sol','lab','fa','mib','fa','sol','lab','1do','sib','lab',
    '1do','1do','1do','1do','mib','fa','sol','lab','sol','1reb','1reb','1reb','1reb','mib','fa','sol','fa','mib',
    '1do','1do','1do','1do','lab','lab','sib','1do','1reb','1reb','1reb','1do','sib','1mib','1reb','1do','sib','lab',
  }


hinos[473] = 
    {
    'sol','fa','mib','mib','sol','sib','sib','lab','1mib','1do','sib','1do','sib','sol','fa',
    'sol','fa','mib','mib','sol','sib','sib','lab','1mib','1do','sib','sol','fa','sol','fa','mib',
    'sol','lab','sib','sib','sol','lab','sib','sol','lab',
    'sib','1mib','sib','sol','fa','sol','fa','mib','mib','sol','sib',
    'sib','lab','1mib','1do','sib','sol','fa','sol','fa','mib',
  }

hinos[480] = 
  {
  'fa','sol','fa','re','fa','sib','1re','sib','fa','sol','fa#','sol','sib','la','sol','fa',
  'fa','sol','fa','re','fa','sib','1re','sib','1re','1do','1do','sol','la','sol','fa','sib',
  'fa','fa','fa','re','mib','fa','sol','sol','fa','sib','sib','la','sib','1do',
  'fa','1re','1re','1re','1mib','1re','sol','sol','1do','sib','la','la','la','sol','fa','sib',
  }
  
--0si do do# re re# mi fa fa# sol sol# la la# si 1do 1do# 1re 1re# 1mi 1fa 1fa# 1sol 1sol# 1la 1la# 1si  

function grupo_nota(nota)    
    local grupo_da_nota
    
    for i,t in ipairs(grupos_de_notas) do
      for i2=1,#t do
        if(nota == t[i2]) then
          grupo_da_nota = i
          return grupo_da_nota
        end
      end
    end 
end
  

  
--num_hino = 1
--for cont=1,#hinos[num_hino] do
--   print(hinos[num_hino][cont])
--end  
  
