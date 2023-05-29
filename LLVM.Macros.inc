{$packrecords c}
{$macro on}

{$ifdef darwin}
  {$linklib libllvm}
  {$define LibLLVM := cdecl; external}
{$endif}
{$ifdef linux}
  {$define LibLLVM := error}
{$endif}
{$ifdef windows}
  {$define LibLLVM := error}
{$endif}