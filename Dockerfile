# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve custom node 'DetailerForEach' (unknown registry, no aux_id)
# Could not resolve custom node 'CLIPTextEncode' (unknown registry, no aux_id)
# Could not resolve custom node 'PreviewImage' (unknown registry, no aux_id)
# Could not resolve custom node 'DownloadAndLoadSAM2Model' (unknown registry, no aux_id)
# Could not resolve custom node 'Sam2Segmentation' (unknown registry, no aux_id)
# Could not resolve custom node 'Florence2toCoordinates' (unknown registry, no aux_id)
# Could not resolve custom node 'ImageAndMaskPreview' (unknown registry, no aux_id)
# Could not resolve custom node 'ImpactGaussianBlurMask' (unknown registry, no aux_id)
# Could not resolve custom node 'UNETLoader' (unknown registry, no aux_id)
# Could not resolve custom node 'DualCLIPLoader' (unknown registry, no aux_id)
# Could not resolve custom node 'VAELoader' (unknown registry, no aux_id)
# Could not resolve custom node 'Note' (unknown registry, no aux_id)
# Could not resolve custom node 'ImpactControlBridge' (unknown registry, no aux_id)
# Could not resolve custom node 'Note' (unknown registry, no aux_id)
# Could not resolve custom node 'Note' (unknown registry, no aux_id)
# Could not resolve custom node 'Note' (unknown registry, no aux_id)
# Could not resolve custom node 'Switch mask [Crystools]' (unknown registry, no aux_id)
# Could not resolve custom node 'Note' (unknown registry, no aux_id)
# Could not resolve custom node 'ModelSamplingFlux' (unknown registry, no aux_id)
# Could not resolve custom node 'FluxGuidance' (unknown registry, no aux_id)
# Could not resolve custom node 'CLIPAttentionMultiply' (unknown registry, no aux_id)
# Could not resolve custom node 'PreviewImage' (unknown registry, no aux_id)
# Could not resolve custom node 'MaskToImage' (unknown registry, no aux_id)
# Could not resolve custom node 'MaskToSEGS' (unknown registry, no aux_id)
# Could not resolve custom node 'GrowMask' (unknown registry, no aux_id)
# Could not resolve custom node 'InvertMask' (unknown registry, no aux_id)
# Could not resolve custom node 'easy imageSwitch' (unknown registry, no aux_id)
# Could not resolve custom node 'LoadImage' (unknown registry, no aux_id)
# Could not resolve custom node 'LoraLoaderModelOnly' (unknown registry, no aux_id)
# Could not resolve custom node 'SaveImage' (unknown registry, no aux_id)
# Could not resolve custom node 'LoraLoaderModelOnly' (unknown registry, no aux_id)
# Could not resolve custom node 'CLIPTextEncode' (unknown registry, no aux_id)
# Could not resolve custom node 'ImageResizeKJv2' (unknown registry, no aux_id)
# Could not resolve custom node 'LoadImage' (unknown registry, no aux_id)
# Could not resolve custom node 'DownloadAndLoadFlorence2Model' (unknown registry, no aux_id)
# Could not resolve custom node 'PreviewImage' (unknown registry, no aux_id)
# Could not resolve custom node 'Florence2Run' (unknown registry, no aux_id)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Kijai/sam2-safetensors/blob/main/sam2_hiera_base_plus.safetensors --relative-path models/checkpoints --filename sam2_hiera_base_plus.safetensors
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.1-dev/blob/main/flux1-dev.safetensors --relative-path models/diffusion_models --filename flux1-dev.safetensors
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/blob/main/t5xxl_fp16.safetensors --relative-path models/text_encoders --filename t5xxl_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/stable-diffusion-3.5-fp8/resolve/main/text_encoders/clip_l.safetensors --relative-path models/text_encoders --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/unet/diffusion_pytorch_model.safetensors --relative-path models/vae --filename diffusion_pytorch_model.safetensors
# RUN # Could not find URL for benlora3.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
