;************************************
; CSM_Graphics: slice_4.ncl
;************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
;************************************
begin
;************************************
 in = addfile("h_avg_Y0191_D000.00.nc","r")
 T=in->T(0,:,{25},{200:350})   
 lon_t = in->lon_t({200:350})
 z_t   = in->z_t
;************************************
 wks = gsn_open_wks("ps","slice")      ; open a ps file
 gsn_define_colormap(wks,"gui_default") ; choose colormap
 res=True

 res@cnFillOn             = True       ; turn on color fill
 res@cnLineLabelsOn       = False      ; turns off contour line labels
 res@cnInfoLabelOn        = False      ; turns off contour info label
 res@gsnSpreadColors      = True       ; use full colormap
 res@lbOrientation        = "vertical" ; vertical label bar

 res@sfXArray             = lon_t      ; uses lon_t as plot x-axis
 res@sfYArray             = z_t/100    ; convert cm to m

 res@gsnYAxisIrregular2Linear = True   ; converts irreg depth to linear 
 res@trYReverse               = True   ; reverses y-axis

 res@tiMainString              = "Slice at 25N" ; main title

 plot = gsn_csm_contour(wks,T,res)     ; create plot
;************************************
 
end
