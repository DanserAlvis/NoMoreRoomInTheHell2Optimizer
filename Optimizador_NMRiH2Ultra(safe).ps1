Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Optimizador IA Definitivo V5.1 (Safe Edition) - RX 6600"
$form.Size = New-Object System.Drawing.Size(480, 750)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 25)

$fontTitle = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)

$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Text = "OPTIMIZACION EXTREMA UE5 (V5.1)"
$labelTitle.ForeColor = [System.Drawing.Color]::DeepSkyBlue
$labelTitle.Location = New-Object System.Drawing.Point(20, 15)
$labelTitle.AutoSize = $true
$labelTitle.Font = $fontTitle
$form.Controls.Add($labelTitle)

# --- 1. HACKS DEL MOTOR Y TELEMETRIA ---
$groupNew = New-Object System.Windows.Forms.GroupBox
$groupNew.Text = "Hacks Internos del Motor (Estabilidad)"
$groupNew.ForeColor = [System.Drawing.Color]::Magenta
$groupNew.Location = New-Object System.Drawing.Point(20, 50)
$groupNew.Size = New-Object System.Drawing.Size(420, 110)
$form.Controls.Add($groupNew)

$chkTelemetry = New-Object System.Windows.Forms.CheckBox
$chkTelemetry.Text = "Bloquear Telemetria y reportes (Ahorra CPU)"
$chkTelemetry.Location = New-Object System.Drawing.Point(15, 25)
$chkTelemetry.Width = 380
$chkTelemetry.Checked = $true
$chkTelemetry.ForeColor = [System.Drawing.Color]::White
$groupNew.Controls.Add($chkTelemetry)

$chkCine = New-Object System.Windows.Forms.CheckBox
$chkCine.Text = "Quitar Aberracion, Bloom y Flares (Mayor nitidez)"
$chkCine.Location = New-Object System.Drawing.Point(15, 50)
$chkCine.Width = 380
$chkCine.Checked = $true
$chkCine.ForeColor = [System.Drawing.Color]::White
$groupNew.Controls.Add($chkCine)

$chkStutter = New-Object System.Windows.Forms.CheckBox
$chkStutter.Text = "Optimizar Garbage Collection (Evita tirones al correr)"
$chkStutter.Location = New-Object System.Drawing.Point(15, 75)
$chkStutter.Width = 380
$chkStutter.Checked = $true
$chkStutter.ForeColor = [System.Drawing.Color]::White
$groupNew.Controls.Add($chkStutter)

# --- 2. SELECTOR MULTIPLE DE MIPMAP (COMPRESION) ---
$groupMipMap = New-Object System.Windows.Forms.GroupBox
$groupMipMap.Text = "Nivel de Compresion de Texturas (MipMapLODBias)"
$groupMipMap.ForeColor = [System.Drawing.Color]::Orange
$groupMipMap.Location = New-Object System.Drawing.Point(20, 170)
$groupMipMap.Size = New-Object System.Drawing.Size(420, 90)
$form.Controls.Add($groupMipMap)

$comboMipMap = New-Object System.Windows.Forms.ComboBox
$comboMipMap.Location = New-Object System.Drawing.Point(15, 30)
$comboMipMap.Width = 390
$comboMipMap.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
# Opciones del MipMap
$comboMipMap.Items.Add("1 - Ligera (Punto dulce. Ahorra VRAM, se ve bien)")
$comboMipMap.Items.Add("2 - Media (Modo rendimiento. Entorno algo borroso)")
$comboMipMap.Items.Add("3 - Modo Patata (Estilo N64. Suelo sin detalles)")
$comboMipMap.Items.Add("4 - Plastilina Extrema (Sin texturas. Solo emergencias)")
$comboMipMap.SelectedIndex = 0 # Deja el 1 por defecto
$groupMipMap.Controls.Add($comboMipMap)

$lblMipInfo = New-Object System.Windows.Forms.Label
$lblMipInfo.Text = "Nota: Valores del 2 al 4 liberan VRAM pero arruinan los graficos."
$lblMipInfo.Location = New-Object System.Drawing.Point(15, 60)
$lblMipInfo.AutoSize = $true
$lblMipInfo.ForeColor = [System.Drawing.Color]::Gray
$groupMipMap.Controls.Add($lblMipInfo)

# --- 3. AJUSTES BASE Y AMD ---
$groupBasics = New-Object System.Windows.Forms.GroupBox
$groupBasics.Text = "Ajustes de Renderizado y Hardware"
$groupBasics.ForeColor = [System.Drawing.Color]::LightGray
$groupBasics.Location = New-Object System.Drawing.Point(20, 270)
$groupBasics.Size = New-Object System.Drawing.Size(420, 130)
$form.Controls.Add($groupBasics)

$chkAMD = New-Object System.Windows.Forms.CheckBox
$chkAMD.Text = "Activar Computacion Asincrona (Magia RX 6600)"
$chkAMD.Location = New-Object System.Drawing.Point(15, 25)
$chkAMD.Width = 380
$chkAMD.Checked = $true
$chkAMD.ForeColor = [System.Drawing.Color]::White
$groupBasics.Controls.Add($chkAMD)

$chkLimit = New-Object System.Windows.Forms.CheckBox
$chkLimit.Text = "Limite estricto de VRAM a 8GB (Anti-Stutter)"
$chkLimit.Location = New-Object System.Drawing.Point(15, 50)
$chkLimit.Width = 380
$chkLimit.Checked = $true
$chkLimit.ForeColor = [System.Drawing.Color]::White
$groupBasics.Controls.Add($chkLimit)

$chkLumen = New-Object System.Windows.Forms.CheckBox
$chkLumen.Text = "Desactivar Lumen y Niebla Volumetrica"
$chkLumen.Location = New-Object System.Drawing.Point(15, 75)
$chkLumen.Width = 380
$chkLumen.Checked = $true
$chkLumen.ForeColor = [System.Drawing.Color]::White
$groupBasics.Controls.Add($chkLumen)

$chkNanite = New-Object System.Windows.Forms.CheckBox
$chkNanite.Text = "Degradar Geometria Nanite para ganar FPS"
$chkNanite.Location = New-Object System.Drawing.Point(15, 100)
$chkNanite.Width = 380
$chkNanite.Checked = $true
$chkNanite.ForeColor = [System.Drawing.Color]::White
$groupBasics.Controls.Add($chkNanite)

# --- 4. PANEL DE LOG Y BOTON ---
$txtLog = New-Object System.Windows.Forms.TextBox
$txtLog.Location = New-Object System.Drawing.Point(20, 415)
$txtLog.Size = New-Object System.Drawing.Size(420, 160)
$txtLog.Multiline = $true
$txtLog.ScrollBars = "Vertical"
$txtLog.ReadOnly = $true
$txtLog.BackColor = [System.Drawing.Color]::Black
$txtLog.ForeColor = [System.Drawing.Color]::Lime
$txtLog.Font = New-Object System.Drawing.Font("Consolas", 8)
$txtLog.Text = "Sistema listo. Selecciona tu nivel de MipMap...`r`n"
$form.Controls.Add($txtLog)

$btnApply = New-Object System.Windows.Forms.Button
$btnApply.Text = "APLICAR OPTIMIZACION V5.1"
$btnApply.Location = New-Object System.Drawing.Point(90, 595)
$btnApply.Size = New-Object System.Drawing.Size(300, 45)
$btnApply.BackColor = [System.Drawing.Color]::DarkRed
$btnApply.ForeColor = [System.Drawing.Color]::White
$btnApply.FlatStyle = "Flat"
$btnApply.Font = $fontTitle
$form.Controls.Add($btnApply)

$btnApply.Add_Click({
    $txtLog.AppendText("Buscando Engine.ini...`r`n")
    $paths = @("$env:LOCALAPPDATA\NMRiH2\Saved\Config\WindowsNoEditor\Engine.ini", "$env:LOCALAPPDATA\NMRiH2\Saved\Config\Windows\Engine.ini", "$env:LOCALAPPDATA\NMRiH2\Saved\Config\WindowsClient\Engine.ini")
    
    $targetPath = $null
    foreach ($p in $paths) { if (Test-Path $p) { $targetPath = $p; break } }

    if ($targetPath) {
        $txtLog.AppendText("`r`n[RUTA ENCONTRADA]:`r`n$targetPath`r`n")
        Copy-Item $targetPath "$targetPath.v5backup" -Force
        
        # Leemos el archivo y eliminamos la basura de ejecuciones anteriores
        $content = Get-Content $targetPath -Raw
        $content = $content -replace '(?s);=== OPTIMIZADOR V5.1 START ===.*;=== OPTIMIZADOR V5.1 END ===\s*', ''
        $content = $content.Trim()

        $config = "`r`n`r`n;=== OPTIMIZADOR V5.1 START ===`r`n"
        
        # TELEMETRIA Y LOGS
        if ($chkTelemetry.Checked) {
            $config += "`r`n[Analytics]`r`nAnalyticsET.Enabled=False`r`n"
            $config += "`r`n[Core.Log]`r`nglobal=off`r`n"
        }

        # GARBAGE COLLECTION
        if ($chkStutter.Checked) {
            $config += "`r`n[/Script/Engine.GarbageCollectionSettings]`r`n"
            $config += "r.CreateShadersOnLoad=1`r`n"
            $config += "s.AsyncLoadingThreadEnabled=True`r`n"
        }

        # RENDERIZADO GENERAL
        $config += "`r`n[/Script/Engine.RendererSettings]`r`n"
        
        # LECTURA DEL COMBOBOX MIPMAP
        $mipValue = $comboMipMap.SelectedItem.ToString().Substring(0,1)
        $config += "r.MipMapLODBias=$mipValue`r`n"
        $config += "r.Streaming.AmortizeCPUToGPUCopy=1`r`n"
        $config += "r.Streaming.MaxNumTexturesToStreamPerFrame=1`r`n"
        
        $txtLog.AppendText("Nivel de MipMapLODBias configurado en: $mipValue`r`n")

        if ($chkCine.Checked) {
            $config += "r.BloomQuality=0`r`n"
            $config += "r.LensFlareQuality=0`r`n"
            $config += "r.SceneColorFringeQuality=0`r`n"
            $config += "r.DepthOfFieldQuality=0`r`n"
            $config += "r.MotionBlurQuality=0`r`n"
        }
        if ($chkAMD.Checked) {
            $config += "r.AsyncCompute=1`r`n"
            $config += "r.AsyncPipelineCompile=1`r`n"
            $config += "D3D12.AsyncCompute=1`r`n"
        }
        if ($chkLimit.Checked) {
            $config += "r.Streaming.LimitPoolSizeToVRAM=1`r`n"
            $config += "r.Streaming.PoolSize=3500`r`n"
        }
        if ($chkLumen.Checked) {
            $config += "r.Lumen.Reflections.Allow=0`r`n"
            $config += "r.Lumen.DiffuseIndirect.Allow=0`r`n"
            $config += "r.VolumetricFog=0`r`n"
        }
        if ($chkNanite.Checked) {
            $config += "r.Nanite.MaxPixelsPerEdge=4`r`n"
        }

        $config += "`r`n;=== OPTIMIZADOR V5.1 END ===`r`n"

        # Guardado seguro sin duplicar
        Set-Content -Path $targetPath -Value ($content + $config) -Encoding UTF8
        
        $txtLog.AppendText("`r`n[EXITO]: Modificacion aplicada correctamente de forma segura.`r`n")
        
        # EXTRAS PARA STEAM AGREGADOS AL FINAL DEL LOG
        $txtLog.AppendText("`r`n[PASO FINAL EN STEAM]:`r`n")
        $txtLog.AppendText("1. Clic derecho al juego -> Propiedades.`r`n")
        $txtLog.AppendText("2. En 'Parametros de lanzamiento', pega esto:`r`n")
        $txtLog.AppendText("-USEALLAVAILABLECORES -high -NoVerifyGC`r`n")
        
        $btnApply.Enabled = $false
        $btnApply.Text = "INYECCION V5.1 COMPLETADA"
        $btnApply.BackColor = [System.Drawing.Color]::DimGray
    } else {
        $txtLog.AppendText("ERROR: No se encontro el archivo Engine.ini.`r`n")
    }
})

$form.ShowDialog()