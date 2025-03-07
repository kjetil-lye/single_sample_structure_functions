CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T110700        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @               ?����&B?��KNj�J?� ���Q?�$
��;?��ZqiM?����_�?�/2�e	?�����@>��EJ;@��$�5g@
���_�@ �Qm~@!ڙ'9�@b��ڜ�@�X���m@������@ ���*@"��_jF<@%)��a�@'���@�_@* �d0@,�\�]��@/R�L�@1 =5@2����ٗ@4�ԭ�$@5�k��O�@7Z3ɁF�@9�`�̭@:�x�q@<��&FJ�@>�C@�@@@:�]^"@A@�~bǔ@BH�˨"@CX'-X=@Dn���@E�ܳ��@F�\��s�@G�:ao�@Iqw ��@JN�UY1�@K��e��@L� �\^J@N-l��f�@O�E�Z�@Pr���D�@Q&|ć7@Qݍ���Q@R�%NX��@SV<H*v�@T��@Ã@T��˒"@U�2(�*{@Vp�0���@W@#���
@X���P@X�j�t@Y�}Ϋ�@Z��J$i@[}tK#��@\`T&S��@]Fv��;�        ?��X@�?��P)�^?�v,���?��}�V�?�MH�oF?��j�:�?��8a�@.?�}�@
��bޖ@'ɟ���@��N�Z@y���@ ��Γ@$bV^�S;@(J�2�(v@,�Ĵ4x@0��Jf�)@3;�s��p@6`S�@9�VP��@<;��V@?��Ml�@A�^_3�`@C��aS@E��18�@G�L�e�@J�=f�?@L~�k�U_@O1P�h@PИ�p۹@R/��W�d@S�s�{�@Ui�y�@V�}3
e@XA�;0��@Y�<�T#@[��?X�@]o+��@_G��/զ@`�߼}c�@a��s�	@b�5Zl��@c����@d����U@e���~�@f��p�@h�U��@iQ�*�j�@j�\��G#@k��ݵn@m�ւ�@nlb�=��@o� D���@p���"�@qJg��@rY�i�@r���ԃY@s��
̇J@tG�<��@uA�ᙃ@u�j�Ӽt@v����@w��7�.�        ?���U۰?��O�E�y?ǅ��~�?��[�3�?��'$�?�:�&wY�?�W�]0}�@e�ݛ�:@
_4�Q�@U
E{@+E��@�V*���@!��_�@$���a�@(w.´�>@,��^��@0¿���@3U~`凜@6 �"@9��9i@<R�v*�Z@?����@A�0�pa�@C�~#���@E����!@G�^�"�i@J;?@Lsa�`T@N�Vq� �@P��L��Z@R�|=�W@S�
��x@T�S����@V�YW�@XU��s�@Y����A@[a�#"�@]����2@^韑�4@@`aI�%��@aT�D}�(@bO8�a�i@cP�j�|�@dYRB��@ehS�g@f~��rL�@g��FT�@h���9>@i�툷�@kB
Q�@lT�Et((@m�0��@n�_NUkP@p��mP�@p����P�@qj�y���@reý��@r�\�U#�@s���@tAO�YV6@t�F��i@u��kꢫ@v� 5���        ?��:kGQ�?�u��<k?���C�L+@p�,�@�񘪝X@�+��`�@$ͲofA@,Ze��I@2�{Ak�@7����K�@=B�5���@A�eo`��@E<&�h�@I�Ϭj@M��W�@P��_6O	@S�h��(@U��2���@XL�eb#O@[ ���@^��֪@`��g@bE5��@c�!�>I@eʋ�N @g�V��s@i�e~�p]@k���G�@m���Tm@o�1R��%@q2�D@r=8d-�@@so���(@t�k�8�u@u���M�i@w>�b�D
@x������@y�o[�GS@{ap����@|ԍ/���@~P��t�@�葥&�@��5��(@�}�̑�O@�M���ـ@�!�5>݇@����|@�����c@�������@��l^�҈@���� �j@�x5Tj/@�k�h�-@�b-k>�&@�]��Kc@�]2"Zgs@�a@� v@�i���@�uZ��8O@�B�S��@��(���b@�Y�Z�5D@���O�'�        ?��J�?���g�7?�bJ���+?ђU7��?�!��lC-?�<i�Zle?�/V�H�?���m� '?��qsh��@�b8j��@ ���@��0�@��*��@���ʴ�@�r��F@
ԣ�@�	jʾ@ ����x@"��b*��@$����@'F��IWe@)�D8^^�@,2??˖@.�Ͱ�_@0ʷ�iF�@29��f��@3����@5D���@6��[�%�@8��*���@:A��|�O@<pNx�@=�Y759@?���g�s@@�SH��@A�E
Kj�@B�HG�2@C�h�@@D�����d@F̺L�@G9���@H`��#�o@I��V�@J��hPƐ@K�s���@MA����@N��
D4@O�8����@P�i�B�@QEs�t$�@Q��hl�Y@R�2����@Sb���P@Tƒ�Nv@T��Ӌ��@U��)h@Va����@W)�[s8@W��O�X-@X��f�@Y��P���@Zf��<�'@[=��|!        ?���d/�?�?޺��?����PX�?�]��L��?��Xw�?�
ķ��?��-P��B@-
�q@�$�*i@H��p�@��n��@�BL��@ �D��@#fsl���@'!�X�
@+@,�_�@/�%8C:@2V=hk�1@4��Y���@7��g�p�@:��i�<s@>5����@@�s)渃@B�7l�	�@D�/\�Ș@F�v�$�@H�!��vh@K+C���@M��%��@P@���@QR�C�@R����u#@T6�^~@U��-���@W�R�	C@X���Y�}@ZBV�8?I@[�����@]�	�ml@_s��;�h@`�M<��@a�sxI�"@b�k�9��@c�2A��@d�Ó�HN@e���s#@f�7�y��@g�]@h��u#g @j��#�@kK�����@l���c5 @m��MzB�@o �:��@p%P/{��@p�p+9��@qxܳ~x�@r'�0{@rِ�1�@s�҆�˺@tGU)�e�@u]��@u��%        ?�&���?���`��H?���\�g?�H%ܔ�?��7�g?��O1�Z�?�Bg����@"�vtu@}�ˌZs@$x��<@Lthp�@@ ��t�@"�%�L�@%�)���@*�)ί�@.�H~/�/@1��ձ��@4�+�ܶ@7� m��@;1f�TB�@>���UI@AG\���D@CN�;�M@Ew ��\@G���A��@J)|P$l8@L�(�Hp@O_�'���@Qu�<�@R��^���@TNַ҃@U�� sOM@WV��g��@YQ,� 1@Zڋ��V@\�Z�V8@^���R)�@`NN��I@aT�wH	@bb���@cy��6|@d�k��>@e�oA�~�@f���@h%��v8�@ieJWK�$@j��)�'�@k�G���@mS���~@n�UQ�\4@pf0E@p�ɯI�@q���,��@r@<�Q@s�G5��@s��"��@t��
E�@ud����@v7�3
�X@w/k5A@w�`{�a�@x�B8q�j@y��:�'        ?�ZO�R"?ۖ��J�?�Ő��@�Wt�#@P�,
��@U,��.7@"H�dK�@)��[p+@0u�CK�%@4��]��@:�U$d�@?�����@C{��L@Ft���@J/[�b��@N7T
�<@QF'��i�@S�=6�7�@V��9�@X�%ܖ_@[q�]��@^\]��T<@`���P�l@bQ��;Ɔ@c�� l�@e�i���@g���,L2@ix=�cMh@ko����a@myBiz@o��G�O@p���A�@r }9'H@s(�}h�k@tY��9d�@u�=�1u@v�b��8�@x �c�@ys*�E�V@zα$�=�@|2�IFx�@}���|E�@)"��h@�G��\��@�
B���@�Э�)@��� �@�i�Ht��@�;��&�@�2����@��i����@�ʃo���@��z����@��K��@�{��>�@�ia//z4@�Z��3�T@�O���@�HN��n�@�D���\N@�D͓f�~@�$Cn )�@�����`H        ?�? ��?����?����ᥑ?�%G��?��{T^�?��\ `�?�#�L?�H�'eF?�2�N�,K@ Y"~J�@�����@�����@H\O@@	cx�B@D���z@�(V�;�@q3#�7@!1�^���@#I��z��@%��b=�@'�<�c��@*Fޥ��/@,�|"UP#@/���$�S@1(�4<�@2���}�*@4!(�M@5����ڐ@7SN���@9	XN@:���@<�U]f�	@>c����O@@%�g�t@A `��'@B"P@C*�2A�Q@D:����@EPQ?D�#@FmG��.�@G��l��@H�E�K��@I�<-�@K#� ��@La����@M���8O�@N��h��@P!ʰD��@P�㼫��@Q}4���@R/����@R�h�^�^@S�=�ǫQ@TZ1
���@U:fOBu@U�QZ&�r@V�l΁��@Wh�QcVE@X3�K� �@Y{&Nݸ@Y�Io�C�@Z���e/*@[|\Z�,w        ?��)�x��?���fc�?�e�hs�y?��7�T2?�y�O"T�?�j� t��?�5:���<@��(q�@	p���n@�^ ��@�F���b@ ����@ �J�K��@$ ��M�@(
�h\�;@,^�z=�@0��+֯o@3'���b�@5���%r�@9�k�@<GT����@?���lAC@A��vR"@C��n�2@E���J|@HU�~��@Jf��|�@Lܛ*��@Oq�څ��@Q���T@R|8��@S�:�0U�@U}�rU�@W�w�0@X�q�ͰW@Zt���C�@\;'�@��@^9�5�@_��$�@`��Hh��@a��V��@c��SX@d�k�@e,"s��@fL�B�$W@gt�Ce'@h�}Y��@iۛ�1=�@k+� r@l`#j��@m�xq�@o �x�@p/����@p����q�@q��L:c@rN��2�@s
�p'@s��46�@t�!h!�@uT�T&�@vM��D@v�Lt��@w�=sj"V        ?�z�W;Rq?��G�{!?�5����?��H��[?�H��;?�t�rNq?�E�m�H@����1@	|�;�Y@ʋ�RLQ@�!fu@�@����[�@ ��c�]@$�o�Z;@'��*�$�@,?auA�I@0y�Y�L�@3	�z>��@5�kJ�@8�гu~@<fK%:!@?t��G�@A��T���@C�Q22@E�bS���@G�?��4@J 2s��t@LeFʌ{�@N炅���@P�s��8@R!����@S�����E@U	��'v@V������@X,	SR�@Y���9T@[��3b�@]KM䉿@_���As@`~o=�9@aup�L�@bsyyM[@cx�]�3@d�{w�c�@e�`��@f�$�l�@gѼ�T�@h��@j'9?h��@k\>WTA@l�t�9�@m�|�o�D@o"��1@p8�i��<@p�T�~Z_@q�K$��(@rBoD��@r��#@s�)W�@th�����@u&U��a@u�	�=^�@v��)t��        ?��R���?�Z�2�?�y����9@���;u�@�
�?�@qq���@#�G��r@*5&P�9�@1CZ�A�@6
a�M�@;p�C�
�@@��� �T@D��R@G�@g��@K�����f@O��*��@RCXޘ�@T�wղw@WS�x0	�@Zt��nG@]U�Rj@`*, @a���u~�@c]��'@e$��~@f���ĳ@h�R�S=@j��G�@l�h�)p @o&1��k�@p��
��@q�Zi)�@s����@t>RD@u�3,K�@v�.��"@x3� �@y|4��*@z� `�)@|P�=�U@}Ȁ���@H�r��@�h�)&�F@�1č<y�@����N�@��E#�@���EF�9@��Ò��@�]��L��@�?�E��d@�%��.@���@��Jc�O9@��u<�}@�扵%l@��{����@��>��q8@����TQm@����@���UTu@�}E�O�@�[���@��7���/        ?��+֎�?��E���t?��AL�;?�Уy��l?��J���?�Fa?��Xӣ�L?���N��?�v}��@
���@QQ���@5%�4�@ �v@�M+q��@M���$@T'�Y@�wZ��R@ PMKc:@"P/�Y{�@$m�P���@&�X#���@)���7.@+y�����@.�׎l@0`� �@1�NG[�u@3@�3��@4��?��@6\Ph�@7����)@9���i@;t�mX,@=DN(��@?"q�f9@@��	�P@A�$�RH@B���g.�@C�c��e@D����K@E����O@F�C�8�@H	\j��@I7y"��G@JlY��}�@K�� ��@L�K�{�}@N3TI��@O�ٛ9�@Pl���R@QH�jh�@Q�)���@R�]ыo>@S:�m�L@S���5��@T���'>@Ux@�U�@V=���WG@W�{.@W�����@X����@YuCAS�@ZK,���@[$Je���        ?�0�oH�!?����a�L?ŉOk�L�?��D� Yy?��4P��?���[�?� �����@�n� �"@Ri��^�@�P�0o@���|̿@�6���@�(2�,@#�YY�@&Ϟ�se@*�,�?��@/[o���@2�B�@4����M@7��K�/@:�*����@=�k�s>@@�p�]�@B�p4Q�@D|��@F���ω@H�C*ǰX@J�jq�w�@M^?�t�s@O���+Y�@Q:|D���@R��]#@S��A|"@Us ��~@V��ځ(@X�5f��@Z'Ax�@[�}XP@]�s)�f@_T��nZ@`�ǆ��}@a����@b}a�vE�@c{�p���@d�7�Y�@e�^l�^{@f����x@g���-A@h�6�+��@i���x��@k"��~��@lS�ԛ�m@m���r��@n��zf�k@p����W@p�;)�_�@qQ�3���@q�N2?��@r��F��O@sZ~55 @t%Ɇ��@t� [*�@u{����        ?���T�?����o5�?ƭ�$�?�O=���?��$���?��qVS?����m!@Z�l$�@
xV�n*@1�.��@��It_@K�h�,�@!s�R�1�@%.wU!�@)Y���@-�ܚO(m@1�wj�F@4O\8[]@7U_� k@:�� l@> <8 ��@@�$8>�@B���e��@E�x��@Ge���6@I�J��@L[]/ɭ�@O
cց�@P�����=@Rg����@S�2�9i@U���׷e@W?����@Y ��<*@Z��^4�@\�괄@^��?5�<@`ZJ3.j@af�K��@b|�S,�@c�S\�)@d�\�\��@e�����@g+�i�yc@hmj�T��@i��3�k@kz�Jok@lg�����@m̆$���@o:u���@pX'����@q�X�"�@q�I�M�@r�D5��1@so�Џ�@t?�9��@u�i���@u�~�F��@vʅ�Z �@w����J�@x��VI�@@yzcCN�(@zg�<��        ?�} lҽ�?٠�,6X�?�Z�ʦ�@�Y��@����^@�o�_@!$��~,�@'|`q�@.�:s9��@3�V����@8�&�T�@=�N��|O@A�6����@E& ��#A@H�3��V6@Lu�����@PD�3% @Rr	��[�@T�Bw��@W8Bt�@Y��#��@\��
��@_m�qҎ�@a8�*,@b��g8R@dr|��?�@f)��+�@g��|��@i͓z�5:@k������@m��;�@oŰ?K`�@p�߇�/@r
��{�G@s+��H�@tT~rE@u��̮�f@v��_��@x \@(I�@yI˼�.�@z�2��@{�~�)�l@}U�̗%�@~��T��@�����@�ӹ|fy@����j;�@�W_�1v$@��X�@��=
%�@���L��J@��v�R�[@�a�F5�X@�;�̽f@�).��p@��\պ�J@��4\[�@�ǭ��|@������@���q@����pz�@���R� �@��E��H        ?������?�mjڏ�?�`�7�?�٘�*U�?�r�@�?���6�?�5�3f��?��̭�@ �0��@]���C@
WD��@����S@�q�B@4n���@�j��v�@�Z�O?�@ �&[_@@"��(p@%?0	���@'����d�@*82�
P@,��I��A@/�8!�`@1T��F
@2�{ʏ4@4y;�݃�@6$���ū@7�t�QS@9��ͻ��@;�B���@=|q6��&@?|k�r��@@Ƒr���@A�B���u@B�?క^@D~C�/n@E:����;@Fl�]��>@G�m̙�@H�iJm�@J2��dA%@K���x
D@L�I�#@NA߫���@O��'R&@P��P�e�@QM)_V�@R��:Q-@R���iw@S���͏@Tj����@U<O'h��@V���kF@Vꒈ�@W�n�ia�@X��"�K@Y�k��ר@Ztw�O�@[`&3�u@\Ok���@]B;�i�.@^8���t@_2P^�e        ?���S7�?�s�c�?�b(.���?����a�?�ױ�5[�?���ͨ5?��F�#@4߂���@Ϸ2�r�@�:7��3@:�0��Q@R�T��@"�{�,,(@&����@*��ߪ�	@/��-�*P@2x3:��@5Xx.rZ@8w��/�@;֋���@?v��@A�Q���@C��l�`�@E�)�%�@HI�ͬ��@J�b��4@M_-(t�+@PK����@Q�ķ�@S!��s*@T��1��$@V@����x@W��3@Y��$��@[�5�l(�@]�+�K�S@_��_�?@`����;@a�DM@c
oZnd�@d1ؙD��@eb�� �@f�>�e�@@g�Od��@i.�ě3�@j�VCH��@k�]���@mR��@nƙ[ծm@p"n#}� @p�u��s@q�fk��@r}C&�J�@sPwNe�@t'ʌ<u@uy&O�B@u���}I@v̳	�o�@w�@&A`�@x�ê\�@y�>D��@z�����(@{�%F�        ?��C}�?�ۤd�x?�W�V#Z?�c��_!�?�w=�
??�UGΫ�?��ڣ�;�@#��F�@��f�@���@e@>�k�@gQn�@~��@"���O>@&5 @���@*� ��N@.H�F@1m�U�W�@3�+I�@6�����'@9fK��y@<n=u���@?��Uq�@A���!b.@CT�^f��@E:��8c@G8�s{�@IO�S�%�@K�gV�?@M�Z����@Pݘ��o@QQ�hlÈ@R�a��C�@S�+����@USF� �\@V���S4@X<M�<.�@Y�&4{y4@[V)�4�0@\�N��@^�����@`+�o��@a�3���@a�0�@�A@b�ɮQN�@c�T=_1�@d�ˑ9�m@e�*˪��@f�mo��@gߏ�IUk@h�����G@jePngz@k$�� |@lF�3	�@mn��r�@n�S��,@o��@,`1@p�[����@q%8��@qǼ+��-@rm=4?@s�OB�@s�����        ?�bE�Q�?�y�/���?���`? p@	w�3Oa@�
O��@ ��+��@'�w%�e�@0:I�IM@5AGсjM@;;`�O@@�`����@D\rի	@HW�+��@L�u���e@P�iT��7@SCu��`�@V qQl�@X�i�z�@\
k�g�F@_W~ײ @ajSJ��8@c@�7�7@e/�#��N@g6.����@iT�/�w@k�I_-®@mٴ��q@p���,-@q^��:G@r��V���@t w�r۾@ub̀@�y@v���@xJN�׊j@y�Ww��@{_���@|����@~��e���@�*���_A@�	j=Kh@���[��@����m_$@��[�m̓@��q��a@����g`@��,��@��Īl�3@����p�^@��Q�@��<X�j@�	�;ة�@�*:Q��@�P>/:��@�{��l�@�V��E�@���-�\e@��nM	@@�.t`|��@���@�7$@�v��C�@��[��d@��lٽ,�@�s�{�        ?�^,R~I�?���^��?�x_�Y�4?ҏr���?߯��N��?�]����g?�n[��u?����_m:?��Ҷ<vF@�}�0Ug@%:�u�@<_M ,�@i&c5�@s��{@�,.��@H��6=�@z�r.U@!�c��)%@#�g�'E
@%��;t`�@(b�]i�8@*�f�0qe@-��ݻ=R@0-���4@1�A"��@3'(3��@4�I���'@6a��P@8,&,@9�}�,�k@;������@=�@�݉j@?�i"�u@@Ȫ���@A���2�?@B���7�@C���<��@E ~&D'�@FI���@Gz^yV�@H��	Ad�@I�:�-4�@K9Fd��W@L��c�$�@M�c��j@O:d���@POUyi�@QE�Yg@Q�}Jf9�@R{��`@S<&�Xj�@T m	|א@T�R�f��@U�՜�.e@Vb�'{Z�@W5�H�@X���I@X�T�R@Y��i��@Z����E5@[��oˁ@\oK���@]Z;��        ?������?���J�?�&7��?�`�ݑ|?�<�o�?��xl�9?�F:Sx�@�����@c�f��@ʂ����@����@h1��)@!lu��oE@%	Ų}�@)ڢ, 	@-~8�씩@1-��g�@3�M�v�X@6���v�@9�4 K'�@=o:k@@P��1�W@B3j/��@D4ql2D@FR�#�U�@H���ϐ�@J���� @Md�����@O���0�@QZ�	SJ@R��Ұ�@T@ͅ�@U�_�A�@We�:��@Y�k��@Zɟ%)� @\�ba���@^m�X03@`+UE�d�@a( j�@b,�P@c9��G
�@dN���i@ekݳd�@f�y���@g����-A@h���O@j0 @��@kup)�@l�	�:'?@nҐ0t@ov�.��@pnsTZ.@q%��C�@q� �ZD@r�hK˔@sc���@t+}Įv�@t�'n��@u��3da@v��3�@wr{�l�q@xNV=��        ?��ʶ��?��CA�?��sER�??ئ/)n��?�Y쐓5�?�-w��?�f$�^��@��Q��@
�i�[^@��J���@��YQ~�@R��fc�@!oН��q@% fS��@)=Xl�n�@-ʻ�^@1e}F��@4 P�w@7���:S@:J�8��@=�3pe�@@�4-��E@B�%��9S@D�D]�>�@F���$�@IXm���R@K��y�W@NoA�)�W@P���$�@R}���:@S��W�s�@U�a���@V�M��@�@Xr> �7�@Z8�!��1@\�����@]�=h�|T@_��6�@aNDP�$@b�V*��@c)&�r�Z@dJ�@�7�@et�.�]*@f�W�:=�@g��ڎͦ@i*o^#�@jy'��N@k��Q�K@m2���E@n�N���X@p��)��@p�7��@q�.Y&�*@rP�̢�@s�}T�'@s��H���@t�\�`F*@u����)@v|H�|�?@w_�?S��@xG�,%��@y4qʼz@z%��#��        ?����y+?�����I1?��h�K@�Bz�@�#�]C@�  Өs@$%+�>&@+��("og@2���.@7O��]@<���M�;@Ai]��b�@D����|{@H��J�:@L��/ٲ@P��!�K�@R��'���@Ur20�A@X$��^fn@[�}�|@^��D$@`�� ,��@bJX���@dL��y@e�_Qڏ�@g��J�@iԚ��>�@k뜧H�x@nr�!�@p,�'V�@qV��q��@r��U"#@s���>*@u|����@vhU2N��@w�pN���@y.�|!k@z�R����@|	څd�@}��$\�Z@5�^�@�hk��/�@�:�q��@�raT�@���o���@��k{��@���ʗEO@��L��À@���w�D@����*_@��~��@���;�o�@��=�<�4@�����!@������@���KΆ@��2x�G@��,(U��@���׵��@�I��v@���)(;G@�D�xY��@��`BQ        ?���V5?���\��?�	C��?�0a�?�I0����?�
H/�ȏ?��O�Z�k?�X!
}�p?�˭��g�@"�j6�@�"HH�@@&�ܕAf@��,�
�@\����@���ہ}@)��?�@ 	�'&.@"8׶��@$U�t���@&���'B@)$�_��@+��j��@.x���R;@0�jЮ�@2)6`7�@3��wa�c@5X^��Q�@7��%pb@8�o���@:���q�@<|d��-�@>n��A� @@8��z��@ABk���@BS��>@Cm��U��@D�t�'�@E�c��G@F�J7�@H%��
@If¦ �@J�8����@Ls�Z�@MZr�Q�@N�:��?@P�<�y�@P�ŉ˹@Q��wK��@RE�-&��@S	T��@SЪ@u�@T���v/�@Uj{��c@V<�;�@W�gv��@W�i:UV@Xɺj�MP@Y�rE�K@Z����?�@[v\d���@\a�Fo�@]P�`�
@^A��K��        ?��H��'}?�黱�]�?�8��x�?���b*?�Tf�8�?�:�j%F�@ ��je�@�ފe��@�N\���@�_�/g@��}@ ��%�.@$v�ʎ�@(���<�H@-]f�7�d@1B$���@4�$#_@7!\>@:m�7se	@=����B@@�W��Fj@B箎���@E�sn8�@GR+���@I�m�5�$@L<��@N���.r@Pӷ-�|#@RFe�Fjc@S��6\T@U[���H@V�7��&@X��CJ@Zr�V�%@\D���@^&�8?�@`'$� �@a���@b>��g@c%�6@��@d=�����@e]���@f�6ޤʾ@g������@h���O]�@j*��26�@kq�J��@l�,���@n�jXgP@or3�1C�@pk���%�@q!�F��@qۮ���@r�_�#@sZ�>�Z@t�^U�G@t���g@u�=�P��@v�k5��@wYA��[�@x0�zx�,@y�KED{@y�ǚT�        ?�1ķ�ī?�$˝��?�Rx[�?�ƻ��LI?��H��T�?���m��?�r9	�3�@R3���@^wx�b@�鑂E@������@ V��x@#�zw���@'�.�՛@,Q]�@0�I�*`@3m ��z@6k��A�@9�{��H�@=&�t�@@r�,0�@Bq4LK[�@D���f�@F�J�x��@I2�g���@K��J��g@NX���@P�3�S��@R �fſ�@S�<��ɔ@U"	�Q�@V���ٮ@Xq�(o�&@Z7�u�V?@\��yi@]���V@_���-�y@`��J�<@b``3��@cw=bM�@d9�IP�4@e_�Z��v@f�n̂4�@g�g����@i��z1�@jL�'k�@k��Su>�@l��?B@nX�$z�@o�͵k�@p�gQEN!@qYjM}m@r��@r⋚I-)@s��{��@t}2;��@uQ�'8R@v)g�Z�@w��@w�0���k@x̭v	�T@y��o��@z��5"C        ?��1Y5}?����/�?�Z4�<�@	���\h�@�R�\O@ ����%�@(yuԙ@0� 5��^@6Xy��b@<�Xи@Aw �t*x@EI��U<�@I��U��
@N"���@Q��	��6@TLM݄l@W7to%)�@ZV{ø�K@]�m���c@`�**�H�@bu��m��@dm\����@fi�y�@h���T`�@j�gِ�[@mS�A�*@o����0�@q1A�f@r��5�w@s�����N@u]�gJ��@v� �p�H@xf�U�Ll@y��B�p�@{�+��c@}Tg��Ce@Ii;x@�n\5��@�Y�b��@�Kn�FGD@�C2N��T@�A���@�D�[,��@�N�t9H.@�^�R\�@�t���@���7@����ε�@�ڧ�j��@�Y͔i>@�;�w��@�u:[MO:@�Z+:0@����/�5@����E�@�I�o�{A@�����q�@���b�o@�S���5@�W-:L�@��RW�i@�u0��@�0g�*��        ?�"�z6?��:�N�?�߾.7�h?��3�?�?�%iGw9?�\g2��?��̂��?�|A��{@ ��%�S@�F}f7@	���2@��?��@^9�'5@{h� ��@Ԏ�	��@iSb'?t@ ��b/@"",Ѱ��@$D�!T�@&��0d>@(�'h�%@+Z�߹Q@-���p	�@0O���y@1��4��@3)QQ��^@4�?����@68n
"�@7ӻP��@9|	~��@;1<�@jt@<�7����@>����j|@@N�`�ϭ@ABTR��;@B<M��K�@C<f���E@DB����@EN���P@F`�8&�@Gy׼Q~@H�&X�@I��I�@J�Sp�@L'�4�@MIR�	L3@N�.E���@OĲ�rv@P�kx��.@Q+K.��@Q������@Rg�s��@S-��k��@SޭYBe@T��m>��@UI/�CO@V����@V���KL@W~'v���@X@�r�c@Y�W��b@Y�\M�<�@Z���B�        ?����O�~?� ��wAD?�xpD��?�݈ģy�?�za_h?�pt]< �?�7�k��@�BgàO@	j%>�׫@�Ni`֠@zl����@{e|@ ����@$.�@'�GB��@,C㯔b	@04G�o@3yGf�;@5߭��`�@8��^SM@<#�Հ@?�pO��@A�3�)@C�+���@E��jBx@G�A���@J5�<��k@L�	��*z@O0���f�@P퍤x��@RQ�TJ��@S�T��@UGʲ�@V�G�R��@Xy�vY�.@Z)4�N��@[��	��@]��=���@_��w@� @`����.@a��g�^7@b��p�B@c��82@d܎�P��@e�X9�@gJ�sZ@h?[H^�@in}H���@j��"�X@k���A@m%ʙ�A�@np��&
@o�^X�S@p�f<�#�@q<�����@q����\@r��_���@s_`PC��@t 5���@t�ўlO,@u��K�@vd�5��f@w.'��(-        ?��?$��?�\�w�T�?Ŝ��L�w?���{4A?��T��*?���p[�?��ScY�@(ˎ�(�@�.�B@Xc���@�"!�X@UD�G@ 7xS9@#�n�8X�@'{�ۙ��@+��)~n�@01�-���@2��j�@5��Z#@8{�8,}.@;����\@?2е��@Ad$�WKI@CVC=Q@Ee��W�@G�$чD@I�5����@LGa����@NΓ9��@P��.X��@R���l@S�J[Z�v@Ur��v@V�ˊ�v.@X8����y@Y�F�R�W@[����xU@]ks߈��@_DΕHk�@`�w,�M@a��zD�@b���$�<@c��yL�@d��6�%@e�m
���@f����@h��4�)@i<�;m@jq��|�@k��1��@l���wy@n;X��@o�0��O@pq�@2Z@q!Dߊ��@q��2��@r�*��)<@sC�ق`@t �m۟7@t��?*T@u�OE>;�@vK(���S@wM5�        ?���fPl�?�;m�^��?�}���@��F�@Z�5C@{�@��@#��(�h@*Z��<	@1���@5�]N�@;�j���@@w�:���@C�NH�A�@G>�1�@K�8 ��@O<�L/n�@Q���Ss�@T89��@V��>+h�@Yk���Y]@\=�]n$�@_5艶V�@a){k��/@b�m,��@d}�rr9N@fB��-�@hM�^�@jz�f~�@k�_sI_	@n
վ���@pZ{�x�@q+�d�=�@rK����@st�� �r@t�]]�=A@u��
��@wՃ:�@xiNt>�l@y��0O�@{b�?�~@|u�㜇z@}� v@z@P+�-;i@�ds�'�A@�$�N{��@�蚈5�O@��Vc���@�{��U�@�K ӠS@�����@��}D"s�@�οwֳ)@����E%�@��EW�@�s�"���@�\v"��*@�I�?zD@�9P��r@�-:�?J@�$����_@��W��{@�e��7�@���'��&        ?�y5�~?���/�b?��%�3T?� %�?�ۦ�'t?�Y���|?�3`J?�i���8@3 �4�d@��~D?@
̷���@4QAk�>@G�I쓃@���@>:R5�S@"��/�@!%� �a@#]�qP/�@%��B7J�@(6aʚv@*�JK�@-�8��@0Ah�8@1�x4�@3\cgO)@51.��6@6�`� �@8��\i�@:c�8��u@<P��as�@>N��K@@.�GD�T@A?�+�s@BW��Z�B@Cxm�K�2@D������@E�C��#@G ���@HO?.W�M@I��h�@J��WD�@LF�y�L�@M�~B��6@O@n{@PCz1�O8@Q ��bR@Q��=�O.@R�U;$�@SO����@T�{���@T� Mf��@U�-w��_@V���b�@Wt�k�3@XS���)	@Y6�1���@Z.�$m�@[8<y�P@[�̘�@\��&��@]�{�
�D@^҉�&>?@_���_`        ?�����l?�����#�?ȵ�����?���G!?�JN4��Q?����V?��ƭ@��r�u`@s|cP�@�m�UTI@ð �[5@��~��@!�38_�@%0���N�@)J�@-�"7E�@1g�O��@4 I3�υ@7*}b c@:GQ4T�@=��^�'�@@�Ȟ�y�@B���FB�@D�+ż�@F�j�V�@IW�A��@KӜ�Q�m@NqIm٪@P�D,o��@R	C���@S� 8�}_@U7��`�@V�ɍQNr@Xx���J�@Z@G���y@\V�,�@^��~&@` 0�r�@a;��@b'��:N@c/�A��@dQ�J�V@e|h���"@f�	ƽ�@g잕,��@i2*��h@j������@k�.���X@m8����@n��r�u@p
H�ћ0@p� T{��@q�5�b��@rP�4�7@sv�r�@s�����@t��p>��@u�uٞ��@vu�b�@wV��=��@x<�w�@y'3ry�
@z�B`ɮ        ?��Jܿ?���b��Q?�T�P��?׬.cdz"?�H���0�?�3�� �9?���K�+g@Q��S�@ﱐ	 �@jc7XHc@	�,�P�@]�6{	�@ 7��_�@#�"Y��X@'pUM;@+�ъD!�@0$���@2��1��@5i��Cp�@8`�[-��@;���~��@>�uL°�@AQ;�$j�@CBn���@EQ.8�SU@G~��}�@I��rԒ�@L6,\2�@N�X�
�@P���s�@Rg4\9�@S����-@U���W_@V����@XIm?��@Y�1p O�@[���t�8@]��l���@_xy��<'@`�)Ze�@a����{@b�K?�@c�+�+1�@d�D�K%@fiٛ�@g:�v��+@hl�m��@i�#����@j�{	&Ki@l3�U��c@m�Qt�@n��Z@�Z@p!�}r�~@p��7~��@q�M���@rM��$k�@sm�@s�a���@t���uE�@uk.�aN@v<y�ˀ�@w���O@w�0C��        ?��kl��p?ᰟU{��?�d�k��@b�Zn�@�n�8@����~&@&c.�@.,��I@3�1މ�@9u/�@?+A��E�@B�c�o6�@F����l�@J��I?��@OL����@R�ZBO�@T�Y��@Wv�>�@ZqY�*@]�.�C+�@`{��k�@bA��CE(@d F���D@f7�G@h&�����@jN��:L@l�F�?��@n�q,ӫ@p�U���@q�A�-%�@sC���i%@t�h�db�@va^y��@w���dn@yf�H�@z����$@|-^��nb@}�7�W��@�9[�@���h@��c��@�s�_*�@�d����@�\
 ��@�X�D�@�[�bڊ@�d��7�@�r,��@�����3@��Fzz"@��*�u��@��.d�2@�cg�>@�;�e}�(@�8���@�� i\@�t�&��@��k�y�@����\�=@�b�`�|@����'@��As@�g�x�S�        ?��q�T��?��2�6�?��J *�t?��=�M?ކ�1�-?�~��gۓ?��`��]�?��R���?����@�(a>g�@cv��_%@U�N��@��ʋ�3@�=�h�@g:ΉD@xY�+z@&)`G�@!�i���@#��ΰ@%Q�& 75@'�K��}\@*��\@,�Q'[?�@/U��Ke@1�&Ab@2� �
t�@4�ʼ}�@5���H@7G0����@8��%�!?@:�<�Wf@<���.J@>o��ξ@@/�i��@A-ب�Ӏ@B3�Q���@CA ��
@DU�>70�@Eq���@F���C�@G�y���j@H�QK4�]@J&8�!@Ke(�%�@@L��x�@M�� :3�@OK�a��@PS4���x@Q��z<�@Q��ʻ@Ro�8 ��@S*I	w&�@S�[�ݶ�@T����y@UnH`�F�@V6A=�@W��@W�E1|W@X��;�@Yu��@ZL��6�b@['T:�;�@\����        ?�JR3�?����^o�?�/1��_?ڸǏ~]?�qB@��?����xV?�dPML@�I,�`�@��G�2"@�ݕ^5�@/0�i��@\@�.\I@"� ��ZW@&�Kr���@+���@/��Tt�@2�����@5�?��ĕ@8�]ѐ�@<Hky���@?�e;�@�@A�*
WB@D��W�@F_ćm@H�^o�W�@KLߒ���@M�ژ5%t@PdDx�@Q�@K�%@Si���@U��D @V��m�9@Xz<�Zۇ@ZN����@\5�� @^/�Ѻ�@`a]G@a,m	b�@bD��j�T@cf+V�@d�����7@e��(\��@g��8a�@hHO� ��@i�����@j�E���@lR� ��@m���u�@o2WR/n@pW�
��@q�4$տ@q���[@r���$�@s����@tUY/6��@u/4�ث�@v��+�g@v�V�P�F@wוt��@x�@�G��@y�V!���@z��� _<@{��*{�	        ?�6t���?���a}t?Ɲ$�N��?��D�a3?��0�a?�E$�Ew?�tz H�@ϋ�q�@	��wV�c@�t
���@�f�Ā@#�c(
1@ �Gt�E�@$1��>�@(�����@,h ��@0��O�R�@3"�4?�@5�܍���@8��s��@<#��s@?�Q4�W�@A��*�@C����|�@E����@GÝ���n@J	���o@Lk��aA@N�a����@P��_@R�6�D�@S�NG/i�@T��w��@V���mX�@X�S�ߗ@Y���ۤ8@[j�Y���@](-�y6j@^�٩�c@`fr���@aY�v�@bT4���z@cUJ|�DC@d]$&�h�@ek�RX?�@f����@g��U
t@h��0��@i�����@k����@lO+v�A�@m�&��6@nϧ���@p���	>@p�Ҵ�d@q`�%�L@r-k?4@r����@sv"G��@t.;�S�Z@t��-�@u�+T��@vi��O�e        ?�aO��?ܼ3�a_f?�G�c�@��#�@�̆��@*�
6@"Æ�~'@)�ђ! @0�Ώ5�~@5���Z��@:�l{(�@@W�i�q@C��!<�@G!�Ĭ��@J���Ǭv@O&�1�@Q���m�@T4����@V���	I@Yt�#4�@\P�YbÐ@_T��K�@a?��7�@b��t�^�@d����ǌ@fv��*�C@hZ���?i@jR���@l]�bŏ�@n|3��b�@pV��;VC@qyA��@r�ɰ1f@s�[�=g@u0HX@va�
V@w�f#20i@y
_��_@zp�+1uj@{��-��@}Tf�S@~��VL/@�.A��Y�@���;6�@��z�:*�@��X��@�l�!o��@�Gsu�m�@�&�sؑ�@�
9�"�:@��,�P@��u�29�@���m�@����¨�@��!y�Nl@������@��9yQtx@����/�@��1-0��@��sqi�@�vn>�ޜ@�����@����9�        ?�n?6N�C?�d��ӪF?�Br��?�.���]?�b_ӗV0?�#8?�?�,���Ӕ?���j�?��9��ܳ@�O;�@Q:2�N@
�.��@
��J�!@�:`wFs@�~[�c @�<]N=@jj�E(@ ��^�<@!�ל�@#�z�}*'@&!/R���@(a��4p�@*�'�G8@-6g��g@/�y����@1=,Y @2�!�>�@4��?X@5�M�^\@7'�ۗ�R@8�ט�j2@:o�ܳfU@<(X;׺@=��?�֞@?�Z�;�H@@���	p@A��r"r@Bœ��"@CɨL��@D�0�{ @E���s�@F�PZ��@H���9@I=i��,l@Jg-D�.�@K�- R�@L��ϟ�
@N��i�_@OJ]���@PH�s�@P���pp@Q�*��g@REn@"�@R��r�@S�QݾǺ@TZ�n� �@U���g�@U��3(�@V�/�sb@WG"��@X�k\��@X̋�
�@Y��7��=        ?�&-�V�?�1C9�9?�DLt&>7?֪{|
�?��{m�?��:�N?� P��7�@�Th�lV@wC�;�@'��@�
�!�@@�:&:@ ��4�@#u�JL��@'Cl��
k@+y(���@0��wH�@2�,1��@5Q;V�*�@8G�U�`�@;w��8�@>�n[���@ACdpk�@C3����@EA0_Ev�@Gm�²�0@I�j�`��@L"y���@N���W��@P�W���@R���C@S�?>)@U��@V�?��+R@X7Ϭԉ\@Y�KąB\@[���2�@]9��I�@_a�V(_@`�-��T@a������@b��c{��@c�n��@d������@f����@g+As+� @h\�o'j@i��FX��@jؚGuj�@l"y0��@mt_3��*@n�I�i@p{���@p�vLo@q��4�/�@rB�@l�#@s��� @sȔ~��@t�V�[5@u^���@v.�S���@w���d@w�y���        ?��m6�@?�s�q:��?�6B�,?ؓ.Cް?�(P��?���U��?��`��@�AO�@	������@�)E�@>@�9~���@��f��@ �>�kס@#��vu�v@'�%_c}p@+����H�@0N�'�H�@2ѥ����@5�y�a�B@8v�Y�3@;�\��0 @>�n<4�@AB�Ы��@C&�f���@E&ϓ8ڄ@GB����@Izg���@K�A~K�U@N>>8ɸ@Pe6���@Q�l�sL@S�KLZ@T�A�mV�@V
�G}�@W���+'=@Y2�tZ^�@Zۍ���@\����h@^W��b1@`��@a&,�#@a��{�5@b�a����@d�����@ezc���@f!�����@g<FũO�@h]��0q�@i������@j�����W@k�?�Is@m&Öu6�@nj	�L6@o��+ %@p�a���@q.���!@q�tm�4@r�r�՞@sEHƗ�@s��L��@t�6�[ �@uy����L@v<X&]        ?���S��?�o���?��?�h��@(99���@}ؼ�M�@��@��@"p^ɪ�@)8�O�!�@0�(u�@@5<�x9I@:;PG��@?����)�@C�ԗb�@F����L@JAA>���@NDy@4�=@QI/�&�@S���k��@VE��j@X�w��4�@[[{�7a@^="M���@`�A{�bV@b8�����@c�}��l@e��eI��@gj�:G@iK���@k>����@mD!x�@o[뽫dX@p��;��@q�*��ّ@sW��@r@t8~�jذ@uq�iD�h@v�~:>��@w�1����@yQ���*@z��ٙ�@|�b �@}~�qB�O@~� w#'@�8�/p�m@��b���@�����@���p���@�[��G*@�.���~@����t�@����]��@��迣�7@�����X�@��0�@EJ@�mL9_�Z@�Y��Km�@�J5�Ż@�=���*?@�5�z~�@�/�t�I]@�-���#�@�pF���@�������        ?����sr?�#{_0C?���~I?��mp�m?�6����$?���sk(?��tښ�?��:x��?�UMK�s@�a�G�-@P�OgO�@T�3@f"9���@\N\?@�q��s�@��gz�@��q#@!<W��Fd@#HvQ�p@%q��6\@'����@*7R���@,�k��7`@/8l�ܠ�@0�x^��@2d!�e��@3�e1��@5d��R=@6��Ⱥ�@8�[�*@:NhWRjP@<&DKuH@=�~h�s@?�[̦0?@@�UF!�@AǬ��3@Bȭ��@C�Q�q�@Dޗ�U�	@E�zn���@G��Az�@H1��et@IY���8�@J����<@K��u���@L�('�W�@N>�^�l@O�����5@Pk��a�@Qk-�@QŖ�Q�'@RwO�(T @S,6���@S�CJQ6�@T�kL��^@U]�ϕ�@V��c�@V�2��@W�xu!1i@Xt�BP1@YA��}�V@Z	(+��@Z��tӦ        ?�\�֖A�?�Ӓ#��?�欰j�?�cp���v?���CG�?��|�86?�޶b	@��f_-@
�,:S�@�J�	�@���]#@�]�m�@!��q?�K@%8)ϸ�@)Q�.uD�@-ٔ��.�@1h��c=y@4����@7����W@::bno@=���@@�� ]�@B�هaL}@D��%U@F����@I!�ȭ\s@K��z��@N��W3@Pf:���@Q�H��@SD��A�@T�:!4I@Vd�׽@Xay�zG@Y��$�@[�6`?�@]g�/��@_R\�y(@`�pL�|�@a�"��Yr@b�%nޅ@c�y�?j~@d�"�5��@f!�t�w@gEx_R�@h}'>���@i�/ZO#@k�$z�7@lVL���@m�a��rF@oϣv��@p=J����@p�W�j0�@q���L�|@rt�ceg/@s:q3�xL@t�ǧ�@t��xH �@u���"�n@vy�0>�~@wS����@x1�Ad~Q@y�Ib]        ?���"3?�J����?�l�W��C?ֿ�U(?�x@2[��?��y$��?�ˍF�{@�ڞ��@�!1v@gP�U�@����@���R�@в����@"�T�m@&(����@*�W�@.[ q��+@1��xL3]@4ː�@6�܇�I�@9����-@<�ؖM�@@-
y��@A��9*O�@C��F�f@E��v��@G��U1ſ@I�H�h�~@K��m���@NA�Nb�@PX���@Q��S� 
@R�eCE@TI�Z7 @U�I>�]�@W)�#*;�@X��]��@Z<k9�˖@[شG)X@]��*��@_7;B@`|���q�@ac��m�@bQvE�`_@cEN�4��@d?g�6 N@e?�:�@fFL	�ey@gS���@hf��8�@i,W���@j�yΞZ�@k��loj@l�w͂��@n!�TBA@oX� �D@pKA�h�@p��ig�@q��x2H@r9��3>@r�t^�k@s����2@tB�ғ�A        ?�n��?��N'	b?�t���X�@��l��@��	vm�@B�r��@"�M��I@)�\׋z@1 K��}�@5���`�@:䣵���@@]��Z�@C��'�7@Gz�W��@J��r�z@O��3�@@Q�p���@T�}�ys@V��=��@YM���3�@\!��R��@_����@a����"@bħ"��@d}=�Ǣ@fH��C2H@h(A"���@j٧��@l �u��^@n9��zd@p2�d~�@qR^a�?�@r{^�Y!@s��!M��@t��2�@v/�׽t@w}��)yU@x��u
Q�@z7A��E�@{�u���@}T��.@~���hy@�jF��@�Շ@�D�@��G����@�s�Q&�@�I�C4�k@�$3>iM�@�UMG2�@��޷T
@��5��6@���$?@��	�!�@@���{`:�@���s&�@���'��@��:?4�@�����u�@���X��@���G���@�h~�g�@��Tc@���-�C        ?�����9?�ڲ�Ӛ?ō��	?ե�Bn(�?�uh���?�Y'���?�@[�aX�?�t���+a@�A�|��@��]�@��Es�@���](@
�1X�4@���A��@;�?�5�@<���X@!����@$� /��@&l�e)�@(��۟�@+��^(B�@.k�-;@0���%z@23��	BJ@3��K�@5to�ݏ�@7-�bq�@8�H]�@:�aRpE@<��8��@>�thU�|@@`��u 9@An E��~@B�U&r5@C���I�(@DŏCV�@E�Q���)@G&�L��@Hb��Dc @I�o��z�@J�+�N�@LD'[eJ�@M�$�.�@N�z�3@�@P4�@P�����@Q���
N�@Rf��5�@S)HA�E@S�q�P>@T�C�W@U�.x��@VV�s�u@W*��2[@X�+���@X�1�d@Y�� �@Z�܈+��@[~��{@\fJ9�@�@]P�%���@^>=��{{@_.�vX�        ?���4i�?�����?�2ipް�?܈�C��?�p}�� ?�g{��C�?�g}:SE@s����@	N��P�@���V@= G�]@9qO���@"�U��@&HwW�	@*y��b@/4^�@2��;�W@4�l�7�9@7�����@:��x@>B����v@@��D��0@B��f
ō@D֓�5Y�@F�ӊ�D�@I.�� �v@K���'��@M����|�@P?���@Q��a_,F@R�Np�7V@Ta-���U@U�J�u��@Wd�补�@X��"��@Z�P�o<@\K�� �@^�P�>@_�ׂb}2@`�M�@aĉ����@b�ɦkm@c�����@d�"W�$@eȑbSL@f�A��@g�0l�@iX�R@j0�*��/@kZG��@l�sTP@m�� �@n�0w6@p �ʻ1@p�MԾ9@qj��M~6@r�[�@r���|�@srx�C[a@t%��G!�@t�;8��:@u�����@vR�XJ�        ?�悄�N�?��p�^?ɒ��[�?�-��>?�wNZ��?���uu�/?��>t�E�@!�]z@��,i�@�\��@&'���@;/�k\�@"�^���	@&q�Ļ%�@*�� ~�M@/�}��?K@2Zܸ�@5/��bS�@8?Ў�/@;��ܥk@?��@Am��sH�@Co�ey@E�{�A�@GУ``Sg@J0)����@L�2�"�@OM�4�f@Q "%�@Ru8ɂ��@S�?�^@U�9|ą7@W",�S�$@X��i��@Z�̵�J@\_J6;-@^>�n#@`�);��@a�<��@b�uݙ�@c-=���@dD��S�@ed�I6�@f�3(�w.@g��~��n@h�{�@j3Q��V0@k{;]|A@l�ɇO�G@n"���D�@o�L��7@pu	�0W�@q,�/���@q��o�
)@r��	�Ȥ@sl����@t4���@u ��˚~@uР��?@v���N��@w|�?��@xXƒ�m@y8��XC�        ?�Qb�0�?�J��C�?�u�fM@�G�Q�@���F��@ *�#"^@'.x����@/���d?�@4�,fmd�@:=��nv�@@A��D@C�\W�3@G��م67@Kľb�`m@P'I9X@R����!N@U7T����@X08�@Z�k���@^�8�>@`�?C:��@bt3ak@dGџ��/@f1}�j��@h1��z�@jFj�L4@lq���3o@n���+�@p���o�@q�����@r�s���y@tF렐�"@u��t [g@v��ہ�K@xh�Pp�j@y��	�e�@{]�$~�@|�j��q�@~{r�1w�@��m�}�@��ܼ hz@����)�@���V�R@�z�{�{�@�b}���@�O;�|�@�@HO��@�6CI&@�0�J=í@�0+K�n@�4 M�N@�<Z�u"@�I.Ox&�@�Zn��8@�p15�@��z�!f@�T!��	J@��b�\8@�x��;د@�4bqB�@����Ӿr@�?S�5�@���S�2�        ?��,H���?��|���R?�iX� �?�4���`�?�%zH�e?���k\��?�+I2���?�R�RA�P?�s��yT�@F4�5o@�n�l�@�7+O6@(�~���@%��rd@`{��}�@،6[�@����_@!@8tZ�@#W�V@%���);#@'�!f��@*TJ~.N�@,�P�YN�@/�
��@1.��i��@2�qu�b@4&�@��@5�2'A-?@7ZS��@9
I
��@:�X��[@<���Ƕj@>rۇͯ@@.�+@A+��H��@B/�_<�@C:�н�@DM_U�{�@Ef��5�@F����F�@G�QU9kB@H���6JR@J��u~D@KO����@L� ��q\@M�qO�@O-�eQڔ@PBM���r@P�u�&�@Q�#U%�@RXT?[	�@S����@S�8|n�U@T��f�~n@UL�I7՜@VZI���@V�.��%�@W�	8^P.@Xq䤟-�@YB�8�9@Z�L�|@Z�M�	@[����5        ?���@A�?� ��{�?Ƶ����?�4p��?��@?��?����2?��)ptZ�@Ē�
.@
';egL@8��J|@�z�{@�6B��@!.��v@$���w�@(�>L��@--wm���@1�*Nm�@3�1�D4�@6���c|�@9�`A#�r@=pK���@@S(��>@B<C� ��@DC���Z�@FiӴ�1@H���Q@KP�j��@M��˪(�@PZgm;�@Q{���O�@R����ub@Tkz�.��@U��O9��@W��p��@YHSx7��@[��'�@\Ԉ�ddI@^�#I��a@`O��w:�@aN)��ph@bTs����@cb�t���@dx|�N�@e�9\ �8@f��1w�@g�!�*@i;�ޏq@j["�Tm�@k����`�@l�8�}0�@n@_{I� @o�<�{�9@p圼�R@q5�\	n0@q��9�z�@r�.vvr�@sm5�{�@t2 �ʉ@t��$3�@u���v@v�ڪ�|@wj���@xA�(dg        ?�
��
�?�+d9|��?�S��#�?����U�U?�Q�mn?�ᐗ���?�^m��y�@*���@yO6!��@��(@4� �@0QjT@!�euU@%�"�|�V@)ض=��*@.{#��@1�p��"m@4�M�z�@7�[�@:�1YO��@>HF���K@A ��m�@B�M���v@EnX��:@GR2Զ��@I��7Hol@L'Q�9у@N��@O�r@P�eP�D�@R+�Vt6P@S�����@U7�"#Z@V�8Q��@X���O�k@ZC���@\����@]�5�@_�|m��@`�j�ߵ@a��#v�S@c
L	���@d# �<N�@eC�OX�@fl��D2@g��xA@h�i����@j�c	%�@kbb���@l��X�[@n�tI�@ooZ��@pl�-�Gd@q%\=PE�@q�+�_�V@r��h=��@sg��-��@t0J�N�C@t���5�b@u�I�]�c@v��?��#@wy���N�@xU�y�w�@y5�R���        ?���و�?�DZ���?��hӟ@/��*K@���R@����@"tS���@)BzF��@0�:�Ċ%@5-,���@:U��$Y@@
d雓q@C6��&@F�4u6GP@Jt�ӥ)4@N���A�@QsfEX@S�>`�L,@VE�X!�@X���qi@[�7���@^�����)@`۫w�I�@byv�z~�@d*6�=�@e��O[�@g�pfp�@i��\E�@k�<�`w�@m�zj]�y@o۝�7�@qR_#��@r,D����@sY�b��@t�b-t��@u�~���)@w�Wh��@xl��,�+@yȏǞ�@{-�x�j@|��%t�$@~,�e@�y3��@��\��A�@�Wo]�t@�$��\@�����12@���q9@�����@�����
@�i�O��X@�Q�C��@�<�I�@�,g )s@� C$��@�4o7�g@�2"Yk#@�3�:P�@�2fP�@� $�5gT@�)���@���yZ�@�'�����        ?�)�(��5?��1���,?�y�N��?�	8��r!?ℾOe�C?�+�9���?���RKe[?����yZn@�Λ/�@��@��@��xK�@Z˂�M{@g��s�@���'O@E�g�C@�IL�1@!vS�@#:U���@%��f���@'�/q�@*n��~@-�f�C�@/ׂ���@1\�ߊ/@2�(u��@4l�1�W�@6
�: F@7�K��7<@9tzl^^;@;?e��U�@=�t[�@?�V3�@@{�t�fd@A~/��n�@B���j5@C�dK-�>@D���8@E��v#��@F���`@H!;���f@IT��5�@J�_X�n�@K�ħ�{�@MWȵ�@Nh��r�@O��z'@P�>RD@Q>�[8@Q��[��@R�7<,2@Sg�8�?3@T&����U@T�����@U��#��@VwA�_E@WC:/��@Xi��/@X�����1@Y�Z�-��@Z�?g�@[n��5��@\Mݴ�a@]/��Th        ?��z�E��?����?���]0�?��+��'?�ΰ���?��
CwpU?����K�@���Y6/@f�k]@�\��΀@�¨���@�`��)@"8O����@%��GǦ@*.�|f�B@.͔$�@1�Nju
�@4��3O�@7���F@:ݰ���@>MV{�+@@�7�
@B�$�D�@E6��r@G0�1/i@I~�_�B@K��xs#@Nu�7��@P�B}�B�@Q��a��o@Se�-F��@T�L���:@Vx ���4@X�� �?@Y��6(�@[���&�@]Q"2�V@_,��iۮ@`�n��@a�����@b��L���@c�$��@d��2Qw�@eÙ�<̷@f�ـ��b@hj]+,�@i=J`Ջ�@jtwrlyo@k��/���@l����1J@nE�Ʃk�@o��1��A@pz�i��@q,$_�j�@q�%��#@r��� z�@sV Ⱥ��@t��w��@t�Lq�w@u�ZȽ�>@vkX��R@w9E��Gi@x Č�        ?��V&�[�?�uH��p?̥I���N?�%�G3_?��P��T5?������]@ �"J@�I	�P@����@�@e�P_@bU���@�~4��@#K^�ؓH@'45��nD@+��!�@0$�<��
@2����@5�����@8��D��l@;؅�^��@?UPo��Q@A�Vί��@C�\d(@E�N$/@G�����@JWP�^@L��&'�@O2�8f@P�X֟@RI��
*T@S��S��@UAJ��@Vӥ}�l�@Xt����N@Z%E H�{@[�w�J;B@]���~�@_�h+��@`����lw@a����(N@b�0:=��@c����JI@d��ǆ�@e�N�L��@g���@hBo�"j�@ir8 ���@j�&�}�@k���@m,
ݿ2@nx�i�@o��ҫ��@p�n�<q6@qBӛ�6�@q���~ʁ@r��(���@sh��~@t&�;�^@t��@wx�@u��@��@vt�Nb.�@w@�,��@x���        ?�T��5,�?��N?�r���_�@�F)�AK@| �V��@"�����@*ž?Cp@207(��I@7�ԗ���@>.���L@B�~
\y@F��lH:@K�gB�@O�z�M�@R�f՛G`@Uh��b�@Xo�R��@[����@_����@a]�oU>c@cH��l�@eM�qx�@gl���M0@i����2@k�TZ?��@na#�I�q@pr�
��@q���Xr$@s��ED�@t���LX@u�2��Ҽ@wu�� �@y;�m@z��Ʒn@|<-`L`�@}�k����@�k�+s�@���T��@������@���b*�@��rqT��@�}��"Vh@�~�lN�@���190�@��lt�D�@��v��Dd@��	���@���<m�@����`@���q<@�G�J=��@�y�G�
L@�XD5q��@��e�pº@��%���c@�:c/�@��mO4K@�����R@�3�b�,@�၎��O@���X�)@�D
,o@��'LM�        ?�*+XY��?��Uib�@?�f�3�Q?�s�H͂�?�se��1?��d�3o?�:\�"��?�$�M0�@w�PN�@�
�`,@
̓��
@@�dp�o@b��/LH@�J���@�<�k�@z��ړ�@!_F�&�@#���j*@&�:�:�@(�zP��@+N
�UzO@.#<�{
W@0��y��@2�,�A�@3�-���w@5k�~��@7-�8Փ@9 �h_��@:�@��R�@<ڎ�B'�@>����@@{�����@A���m�@B�%�ª�@CНrd�@D�:a 4\@F1�Ԅ@Gn�S�Q@H�%8��@I���Z\@KS�>c�5@L����K�@N�p�:�@O}�`�J@Px0�UD+@Q5"\��@Q��]m�>@R���D6@S���at�@TMd�g@Up�Z��@U���'@V�'��g@W�Ǎ5[�@X{�t�4W@Y\j�}��@Z@_i]�@['�Y|6@\`��>@] W`Ăk@]�Γ:5@^��%��@_�zc�&        ?�T1�2 &?�t](P?K?̀����i?��ZTW�?��Ĺ���?��'����@ +z��@�,-8�5@��S��@h����@ih��@ Rz$�m@$
�!5@(7���@,�L��-@1 � f�@3�Kd�@6�U�x�_@:8�9K|t@=��k��@@�yR��<@B�FrE�C@E�y�M�@Gl�Z|C@I���@L�sP�e
@O?>�"�@Qū�@R���dO@T(���@U�I���O@W���6�-@YR��\F�@[/9��W@]�H� �@_�'��@`����X@a��k�6@b�?n�@c��}R�@e���z@fN2�஛@g�x9���@hճy��@j&�M�\�@k��eة�@l�,(4@nO��w�}@o�˻`C�@p�?X�[@qd����@r,6�G�[@r�O��:@s���E,�@t���"�y@uv���@vT�W�8X@w6y�ki@x�h!e7@yW���n@y�;,\-@z�g>��@{�׋�n�        ?��dX�f?�2�V�r?�!��?ݜZ�!��?����?�V�� ��?��o5�.@��cr@�����@#m񜟉@���<��@ ��ڙ�@#�0X,�@'�5�,�9@,t
u��@0�����@3��e��X@6�D�^�f@9�����@=UP䮼@@��g��@B�wx���@D�ؑ�O�@G?���@Ip�VM�@K����@N��Yhw�@P��C+�@R<�6%p@SɣM�1D@Ug�Yj0@W���K@X�Zj##(@Z��}<l#@\�LM��3@^���o�@`G���@aT�r4�m@bj���.@c��/�@d�i��8@e��@�� @g����@h[Dة�@i�����\@j�?e@lU��@m��j^@o'#R��@pN����%@q��l3�@qѭ-��@r�����Y@se��]�@t6��Ntu@uelǩ@u�|F"I@v����i.@w�QV�A,@x�$�gX@yr׊�#�@z`�#X��@{R����!        ?��`Q�y?�_��>�k?���<@9]�w�m@R��'@"bX���@)��	�@1���M@7[�w�u@=ʠs��k@B��)�@F��
S:�@K!G9�g@PR7%u@R��{��@U�k�,��@X�B�c@r@\!(�i�p@_�0q��/@a�/rO҆@c�����Y@e��S�@h"���[a@j{����,@l��%ڱ@o�gr��]@q�҂2@r|z�φt@s�ῄ)�@uo��@v��T�� @x���y@z@�Mc~i@{�Qޔ@}�i��(�@���`��@��FRLM�@����%+�@��)l�!@�� �9�w@��\u�@���,*P�@��c���@����4�@��K���@�4z<kO@�a�r�@���D��z@���@�
��@�&�f��@�˺�*su@�sWOA�O@�¬�B@���ΰ��@�z�@9��@�-����^@���,@��x�@�U�.�AX@�#�.��@����ܝ@��m�ٺU        ?�U�.��*?�ң�p�?�
�=�/?�6>v�?�6��Rq�?��3N��?�G
�}{�?���"���?��h��=@��g�O�@,Mڋ�4@UKJM�@�2bA;@��w�@�u��._@�ρV�d@q��j �@!����@#��N�dv@&PP��%�@(�+G�_@+[RU_�@.�ZN~o@0t��,��@1��f�`3@3}>^<O@5݃?LH@6Ʃ���_@8��%�p�@:P���-E@<-���\@>�m}4Y@@�ǣ �@ADm)�5@B �GF�R@C6��mr@DU+��@E{6nv�@F���8S@Gޯ�E��@I�_&:@Ja;)i@K�ē���@M�D��@N^x�#�@O��v�3�@P�bc2n@QO�_��r@R�lW��@R��<�K�@S��"i�/@T[+n���@U'�W��@U��򟛫@V˓( T0@W�L�'�@X~��&`f@Y^b�V@ZA7�:ح@[(Cf��@\�H X`@]49���@]�i�0C�        ?�}+��yw?��Cb<�'?�^�H�?��cSjx�?��&	e?�YP��N?��̹��@��j
�@
����_@�=z�Zp@���!��@̎��@!��בè@%�g^��@)���4	�@.hf�	>0@1���i�@4�T58J@7��iű�@:��m�[@>q���x@A<���@C$p���@EK�W2��@G��(�r�@I�U�bG@L�t���@O;	hQzf@Q@7?@R�M@��@T�f7n @U��P��@WV���@Y�gnW�@Z�Vq�_K@\�\�� �@^���y��@`c�
��@ao��@b��J/��@c�A�К$@dǘ�B�
@e��W���@g.��"(@ho��Ft�@i��4@k�S�&@lfǲ�o�@m���WD @o7�!nj:@pV����@q���;@q٥qL�t@r����i2@sn5��U@t?+�u�@ue��i@u�1t��@v�0Oߨ�@w���`�@x�����I@y�ͭ��@zpm�'�&        ?��C�2L%?���t��?���%�{?�x�uG3�?�-��~g?�	��;�?�08�ߡ@`#��$>@
s�O��@s��ߛ@g={�a`@TW���@!MGJ�hv@$�E'��f@)X�T�@-�I˺�@1:g��@3�d�E|?@6�k��Z@9���A8@=X���j@@z�|�@Be�[�3@DpH�#@F�&��	�@H���w:�@KGF��s@M�Ȼ�V�@P8�N�< @Q����@S=cUR@T�
�J�@V��{_�@W���G�@Ym�!}�a@[,�on9@\�wq�T@^ل�}d5@`ctsˌ@aa��/]@bg�P:v@cu?�=�@d�N��g�@e�ߦ�6�@f��Q���@g�bi�,r@i)A3{�`@jc{�o|�@k��tc�@l�ؚ�+^@n=�L�?Y@o�!q�5�@py���}X@q,{��zo@q⼂Ltg@r�|ݤa@sY�X�5@t]͛�@t�r�s:�@u�����@vp�;�Q@w>���@xi���        ?�2ǿ�̋?���y�?�[����@U�V�o@����LN@�Or>��@!��� n@(Q���@M@0�(vv@4qߊ��@9tf����@?�qE�@B����@F����@I�'�_�@M��.��@P����m�@SD܎&v@U�5����@XK���iQ@[؍ ˒@]���2��@`x�[�@bX��Q@c��㌊9@etNH:1r@gB��ӑX@i# ju�%@kM�'@m';M%�@o2n��ڧ@p��jT{@q˜�d��@r�R�q/!@t"����@uZ���1@v�HxG�@w���x�@y:7��U@z�M �@{��y4��@}i���
}@~�H��@�/�Kޡ�@���O@���X8fT@��~�&�@�Zʍ�%@�0w��@�
��s.@������@�˽6�b�@�����'@��r�w�@��[D'�C@���׆�B@�{B��8@�x?iO�}@�y��}�@�C��s{@��G���Q@�K�:��@��&RA��        ?�6�H(N?���D��?�)�W���?�^VT��y?�NY�?�8H!��?����?�]H#��?�y�k���@^�{uk#@l��,j;@	���))@�O씏@A��+h@닓�ڀ@����{@D���c�@�И�Z]@!7����@#)$8d��@%4�r���@'Y�qVC@)�Wb(~�@+�ø�4@.bP#ͺ@0v�<�@1���b�@3'��:�@4�����@6�;V]@7�|*�E@9!��=��@:���e-c@<j$�Ŭ�@>!4��O@?�Ǉ�f@@�<Ie@A�o:��@B��ƍG@C�|^��@D�O����@E�Qȝ$�@F�~N@��@G����$@H�D��8�@J�{/�t@K>yk�;�@Lj,!�K�@M���P@NӖ���s@P�Oi�:@P�b��j~@QO�rA.@Q��-q�@R�>D�@SN��7��@S� ���@T�8�I$@UhRif@V!N���@V�+ٮY@W���6@X]X��%        ?�hGQ���?�z3�1�?��L��l�?�@��we�?泍H�f?�Y\� ,i?��A���U@��^-j�@
�b���@~�?Xɔ@g�Hi��@�
� @!;��bL�@$�+���@(�
�{H@-C��,@1˜A�@3�vD�@6��\B�i@9�/T�I@<�7^D@@6c�&@B�;9 ,@D��0@F)�G5i@H_�."��@J�A�N@M#�[�@O���Ƌ@Q.�� ��@R�0����@Tp�8�S@U�o`A�Y@W,+���@X����N@Zf�2n�@\#�K�FG@]�m2(آ@_��Y��@`�c3R�l@a�9`��@b�`}�]�@c��qD>!@d��؛F�@f�}�@g-�{ @hU�S�7@i�N��e@j�W^�ao@k���17m@m<wtVk@n����@o�rN{�O@p�0��
y@qJ�L���@q���r%@r�n�`�8@sq�OI��@t0J�l�!@t���@u�9�jI�@v�s���@wN*����        ?��y#���?�  �y\�?�i�W�`�?���M��?�����?����e?�a=X< q@ �K�jE@�ȱ0��@!�f��3@Z�0��@M(�2@����@" �ՌT@%�I*%�@)���>�C@-П�H�@1;l�2��@3��	4�#@6vn�c5�@9_Y����@<{B��o@?���m@A�M�!Hh@C�z�c��@Ev�����@G�h��@I�͉z�J@K��n`0@@NR��"@Pe��Q�b@Q��Rޒ@SU��U@Tl>�C�f@Uް���D@W^��)�/@X�_H���@Z��r�0@\0���Z�@]犭��@_�#���&@`�J&2&@a�r�t�@b����j@c��� 3W@d��@g`�@e���_h@f�|NM@g�6/Ov@iz,%#�@j,�%���@k\ECxڢ@l��8޺�@mЃ� �q@oV�L%@p0��!us@p�:�5�a@q�c�C@r8#��Y@r�{Ե��@s�n�"y1@t_�"ѩ�@u%���        ?�RR�[�?�]��V"?�%PnI@l����@�!��@Y����@ �G�&@'�"�2@.^�p�@3[|���3@8t+h@=MїU!G@A�w�J6@D��F�g8@H��Y�@Kё�C@O��d�G�@R$5n?@T@ux��r@V����p@Y$کX�N@[ɶ���@^�4ӥy�@`��å�@b@�;��@c�T�)�@e|y� ��@g3LwW�J@h��qXc�@j���z�`@l���5@n�F4L��@p_�Л}T@qm-��@r�Ҹk@s���@t�9��@u��y!��@w,���/@xl�p%@y���ʉ@{=�l�@|[)�lj@}�H��9W@#����@�J�|\@�XE|�@�Ƽ0��@��1���@�S�8��@� J��!p@������Y@�ŒV�?@��A�Yp�@�z�<zI�@�[�`���@�@i�)�@�)%j97a@��ֲŊ@���]�%@��^���"@��g�@���i�w�        ?���;�?���n��?�eYT��?� ;j'E�?�#h/��i?�F6�
�?���2�?��E;B��?�(Y
�%@�{�v%@OV`D�@k(��=@�7p�\@���M�3@ޗ�SX�@l���)@;^M��@!�L4��@#�5��f@&bF�)�@(}����@+6o��@-��kӶ�@0;x�d�@1�v��}@339��l�@4ƨk�j@6i�'M�%@8j��t@9��{4@;��)�@=�)9���@?~x-ӌ�@@�c��+@A��1�Ω@B���"@C�W{Ÿ�@E�{#��@F(ڦ�q�@GS�
�UO@H�#���i@I�xeG@J���~��@LGS(*�@M�Ƶ�.@N�0�a�P@P#¯��G@P�\o҂�@Q�_��$@RB�Zr9@R�����@S���)�	@T�"�63@UE�m���@V�]�"@V�{ V"@W�7�d9D@X~@e0�@@YT�����@Z.'���Z@[
�g�"-@[�܌]@\�Y����        ?�4ў$.]?���J�?Ǌ�6E��?����?�El�k?�Xw�y�?��_ND�s@�l�@,@
�f�;y�@ͼ����@��ֆ?@�|ݴ=@!���w�@%�l����@)����j\@.p_���@1��
N3@4���@%@7�R�+��@:�pCѢe@>�-ӳM%@A.9�Du|@C8	6�@Ecdؑ�@G��<��J@J �j�@L��61N_@Of]����@Q�il�@R�ά]@T*�T&j�@U�Hy8��@W}j{`G@YAJ9���@[��pC�@\�e�f�@^�����@`�h�N�p@a��k�J
@b�S�h��@cǬ\V��@d��O�@f#��-@g^,��N@h���M%@i��ς��@kD�R�S	@l���E~@n
J�<��@ozX�qº@py����@q:[�t.v@q�~`ܴ�@r��k��@s�ɮ�@th����@u?\n��@v�h�@v��>�@w�a8��.@x��7y�@y�����k@z���H�        ?�+�Ц:Q?�VK��ra?��8����?�3P�6B?��/ќ[?�@�����?�p�^| �@a����~@����@7���!�@�%^��@��;ڱ@�o<���@"�Zm�j@&H݁c�@*FkNi�@.��n�|�@1�����@4K
G}�@7��Ag@:����{@=Bwp(X@@T{E��@B"[��!=@D
�\�Y@FA|��@H,���r�@Jf]��ق@L�Ѿ��@O*Nȥ]�@P�jw0q�@R-0��@S�t"�xY@T�0�ۂ�@Vv\�k�y@W��Ji��@Y�۬�@@[8F�9@\�Rk=$@^�5���@`8[�O�@a$l��@b�e�9�@c����X@d�Ĺ@eċP�@f �����@g3>� ��@hK�Q]ќ@ij䚰O@j����@k�u���@l�]NQx@n$� ��{@ob�,i��@pS8z��@p�6� [�@q�< ֢+@rKE����@r�P�P��@s�[�8U@t^b)*gU@uc�뤲        ?�@L�=C?ݼB"�]?�/+�J�@ɓA�@�.8�+�@�̠@"�k�9�i@)�pT��X@0���<!�@5mqȂc@:��N�}/@@1����j@Ca�:ސ@F�}'�e2@J�_���@N��w*��@Q�xa��@S�BO/��@Vi��Ɔo@Y���@[�����@^�c]=��@`�%�kM�@b�<�p}U@dH\�@fh	Y�@g�;�%@iү�a��@kР
�2_@m��cl��@p��ն@q��Ar@r?>,��@skm8iư@t�xRsX@u�OƻQ�@w$�M.�@xt"��m@y��[h@{,<˳�w@|���ɣ@~��GC�@A�Dֽ@��VR`.@�EȌ�;@���}Er@�ڃ��0�@��!���@��!(�@�W��A��@�4"J�@��\�@��͋�0)@��B�̵@��p���v@��R�
�^@�����@��ߐ��@���Ќ�@���(^6�@���ˎN@�O�OO,�@���I��1        ?���v?�?�.���a�?�$��Nm?�=V��!7?�G=|�3?���o?���:
�?��u/��@ �Q�h6�@2�m@
!���B@����6@+d{�@�>�Dv�@vM�wq�@0�����@ �q����@"��Qj��@$�� <��@'MZ=��@)��P���@,h�r'�i@/'8�-@1�-��@2��cK�@4�@�R�@5�A+K�@7c��b�n@9$��.+&@:��w٘@<�/�N�@>��y\@@eCdq΢@An-��|@B�6>@C��w�`�@D��_�S�@E�e,�
T@G��e@HI�\M3|@I���a�m@J�.-N�@L 5��Z>@MvΗa�n@N��˞A@PS���]@P��"e@Q�V��y�@RL�+��@Slqzg@S�����@T���6@Uj���O�@V;a���@W�yu�L@W�ӳ��w@X�s�$@Y���~��@Z�d�{�@[k��y{�@\Uj(���@]B��3K�@^3M{\S�        ?��UF�?�#��J�?ʦ�`?�
tYx?�<�x?�,�U�_?�AԳ.�@GyN�HO@�vԊ��@�w�ד@���a@����3@"m�e���@&9S�6wF@*p�G��@/���YN@2�:jd�@4���9*`@7ۋ�1qj@;�W��@>�،�q�@A"�T�@C�8�8@E5�"@Gn.�9��@I�f�5	�@LA���@N�w��@P�l�o!@R9���;�@S��v��@UH����@V�d[i�u@X�,��0�@Z^�Y\@\2�>��@^Nl/�,@`�0��@a
��Q��@bkY��@c,��z�~@dJ��<�@eqwg��@f��-�QT@g�/Z�m@i-�d �@jcﾾjU@k�v.��a@m�\{��@nu��1�-@o��v��@p���d�@qkB�
M(@r.�_�2�@r���iȸ@s������@t�l�PҞ@uhN�[Ei@vA���B:@w ���[@x �w�@x�ܠ:��@y�1��z�        ?�N�c�?��$�+?�j�N9D�?��~P��?�gEs^rz?���#$#?�,�" W@H߉ȳ�@
;�ri3�@A9'
v9@=:9�}@��bq	�@ � x"��@$�[��@(~I�\�@,�d���@0�3O;*x@3m�1z�p@6@����@9LQD�@<�A��4n@@��!�@A��Z�@C�Ἇ,C@E����H@H,z
��@J�@0�w�@L�/�
�@O�_���@QsR Ug@R~�I	�.@S��9g�@Uy�t�@W�oJ��@X���N�@Zc�%��l@\%{K��@]���]�@_־�+�j@`�g�l{@a�Yq|~I@b�2Y��@c��q�@e�\���@f+&�@gP��S@h|�%u@i��Đ�'@j�X�#*@l/j�'@my���F@n�� � �@p��FjX@p�(\o!g@qwN��b�@r/'�~q@r�g@s��ȑ�;@tl�h$�@u3S!�?�@u��&�3�@v�S��8�@w�ĤH8u        ?�S�1v�f?��%�7?�}m�U��@�4��4@{��և@/�2���@%ŰA�&�@-�B^�@3����m�@9
.0s�E@?,T�_@C�5g�@F��뚈�@J�mc��z@O�E�n��@R5�b�_@T��=GW@W�����@Z�f�q�@]�pט�@`�5�7��@bz����@da����@faG�V=@hz�
Ę�@j�����@l�փ��[@o_��H�@p�\�6p@r;�ғ�@s�ÝW�e@t����+@vm�X@w�K4���@yx.]Q��@{��[&@|�Н��/@~gv2k�@�ʯ��@����@��d؟�@��2�@�����X@�ʎ|A��@��h�Gs�@��O��,�@��>�� /@��1}��;@�!�4|Q@�<��R�@�c�"�$�@�����J@��7G 0a@����[�@����i�5@�Aj�*��@����·�@�������@�:	?�@���?��@�����~[@�L����@�eټ�y        ?��*H�!?�$/����?İ,��Ǟ?Ե}x#+�?��G+�?��s?�Q���!?�1���i�@���K�@��.��j@
���>o@턥@,b�P@�*�y�@2M��@�]�o־@!
F�@#<O���@%�>�@(=�@*���F@-V�8�@0l��@1�j���~@3&�����@4ƀ���Q@6w&M��@88x�T�@:
a�O^"@;����C�@=�}ɬ;@?�]���@@�����&@B���>@C%��@DE���\@Enrԣ�D@F�����@G�1̡h�@II��@J[�{0#@K��@��)@L����E�@NZÀ�f@O���?�@P����@QL�����@R�p�U�@R����R�@S�o(�2�@TP=��@U@/u�@U�n|��@V���� a@W�4K0��@X\�9�k�@Y5c7�	@Z0�Ws@Z��7@Y�@[ц���@\�:�y�@]���ۣ@^�n����        ?��P�s_�?����~2�?�m>�q&�?�סZҐ?�˭P�ʂ?������?�	k՜j�@�e����@� H�"@�k�o�@�����@Gry�n@#0o��*@'+�,��@+��#���@0;��A�b@2�7�f@5����i@8�a0V�@<RI�_�@?�c��i�@A�s񙤠@C��_���@F ���
�@Hmg(�]@Jٍp��@MeuU��@P�!3'@Qnn���@R�@��@Tj	�1f@U����e&@W����v�@Y[��
�@["��0@\�>���@^ޑ�i�@`ju�m�@am�I1�3@byB�ˊ@c�i�9	@d��vU֣@e�$Q�R�@f�~�?@h)Ќׇ@ie?�c@j�CY�@k�W�3e�@mFK-���@n�|~*�@pِ��@p�=a6�@qp"�W�@r-B7�p@r���9�@s��G�j�@t{L�@uGO���@vb���@v�;3���@w�Ԝ�NU@x�)�,k�@y}6i�<        ?�HGH7o?��0�L6?���Ag�@?ۂ�Z��?��8z@I?�.�*/�?�^�lӚQ@��ȝ�R@|
ʲV�@p�o�N@����(@J�Nn��@#A���W�@'R(�k��@+��GA�@0m�O0[�@3-G�E�.@6,Ol�.�@9k���@<�:O��@@Xg�(2�@B[�M��@D���P��@F����@I1���3@K��N��`@Nl=U@P��YL��@R��@S����-@UBG:�.�@V�I�Y@X��'�8�@Z�T��@\hg)��@^^/߆>v@`2׮,R"@a?r)omG@bT��:ň@cs0�ߊ�@d�Ph�M�@e�A1{��@g�蟳�@hD���^�@i�؟���@j��߄g�@l=��k��@m�FA%��@o���Q@pB�߲ڬ@q
��	�@qŭp�f@r���Э|@sY�H�y@t*q�E�)@t�I���T@u�h����@v�˕dI@w�o�e@�@x}Q�D�@ygo�}7u@zU����$@{HT<�/        ?�km���?����3?�t���@�d�!.�@g��)@Z��6�@%����Q!@-���J�&@3l%m���@8���#ɿ@>����0@B��@Fs�ԃ��@J�Xg��@N���{H@Q؅Y@Tgآtx=@W$}S_�T@Zu;�.�@]%��S@`5!ԅH�@a����3l@c�Y��ϒ@e�&E�E@g�DS%z�@i��
��@k��ظ�@n7�	a@p6���@qj��=
@r�b�@s�r|��@uH��N��@v����@x'ekAX@y�����O@{#�@|��2r�@~�XQ&�@�!���@�����H�@����V�?@�`��(]
@�A�jfyX@�&�ԋn@@�����a@���#��E@��i#�@��=��G�@��?{E�&@��˭��@��g�+}�@��}5���@�݂�Z:@��)kQ@�)\x2�@�!����@����(��@�A�ʑ?P@��1�U!G@�jo��/@�����@���N�/         ?�	���o�?�y��C�A?�Qη�?�:�z��?�l��{��?�>%g�?�	���?�r�n��?����}]@��:_@�V;@@�ɝ�7@�`$���@�k��@;�?=Z@�1T���@�����@!�X�8@#� 	J�@&Bj����@(�FѕY@+-�?���@-��E��@0K޳?ig@1�%��@3@G� �@4�B��@6t��)�@8%���@9�Bļ�@;�R)��@=�Gt��@?��B=ڡ@@�6J/ԑ@A�L���@B�>�%=t@C�
d�@E�	l×@F<L"@GkZ��N@H�Y/0f�@I��Y�@K'���{3@Lu�uԧp@M�k�
@O(Ӻ���@PF�*3K@P�4�hM�@Q�C
>o�@Ru���@S6��P��@S�� ���@T�ԑ{�:@U�8�$�@Va��d�f@W5�� @X�� %�@X���xF1@Y���̉N@Z�� ��@[��?���@\zѦ!�@]h^�v��        ?�P#a���?��|�M�?���]�?�a�/��P?�p�Ác?��&�4��?��c��o�@�،V@�v��.�@6�{g�0@���NVK@��"*�@��R	m^@#W~v�@'��0�@+3>fyn@/�!�uc@@2T��O�@5�α��@7�*�;�@:�Fc�i$@>P��6�@@�fs�@Bή+���@D̎vS��@F�>�2�@I�W!@Ks����@M�	�L��@P:�}
r	@Q��4H�@R�_|G�@Tk�1�37@U�`�W�@W���q�k@Y#S��?�@Z�%-H�!@\�)�=nV@^clIΛ�@` �5���@a��7O@b���(@c�.�(�@d*��x�x@e@�R��@f]�HĬ@g� ���*@h�C(��@i佖f: @k!0�Rp2@leh�ݽ�@m�g����@o.�4�@p0_�u�@p�21�<@q��F`@rQ ̩p@s��^ @s�Թm�C@t���m@u^1��`�@v+?��ґ@v�7�-�Z        ?��G�?�~E  �y?ųx74�?�"��n	?��G~&��?��
��V?�i)t@@.CX=�@����=@0���ǚ@�PZ��@�� �_Y@�o��7�@#XP��U{@'0�@+;W���a@/Ǣ�믑@2_-nz�@5���yG@7��w�bS@;���@>us��B�@A���?@B�B5r@D�Ez�@G*e~H@IU0ʊW@K��j�"@N2��A+@Pg�`���@Q�htcEz@S2��l�@T���޼I@V<Q[�3@Wت�U�@Y���1@[@�@@%@]���j@^�<�&@`i�E�O�@ag����i@bmo��j<@c{({o�@d��o��@e��I�I@f�5�.�@h����@i7zWs�A@juK5�@k��ڛ-�@m#�
,<@n]�/�5�@o��t�@�@p�%;�
@qF���@rO�GP�@r��P�@s�>w?.�@tH�{O�M@u��-%@u���6@v�8'��@w�?��B        ?�9Y�=�8?����ϸ ?�iU���P@���	��@��%�~Q@0D�"�@"�xN-�@)��v�N@0�J�4}�@5�x�A�@:��,��@@R�u�h@C�SOҭ@G�)=u�@J����*@O�b��@Q�x�(�@TKd�@V�_�~dr@YSu��P�@\+�c�Ş@_,"I��@a*{{��@b�%���1@d�A�~7@favkY?	@hG7�&@jAn&g�@lP#5�A�@ns_[5#R@pU��cI@q{�';�@r�?���5@s��]�@u,�v>@v{�Efm@w�'K��?@y9*Dc�@z�/���@|��{�@}���o�~@.�g�@�b��&3v@�2��:�@�P���b@���!�r@����޷�@��5>��@��`B�\@�}o��@�p^�*�@�h&�5V@�d�_�D7@�f,^�f@�l_��X@�wX����@����X@���3��@����U8=@�iMr��J@����$g�@��="_"@�$;E�        ?�������?��e��Y^?�������?��5k��?�В�g�?�����?��YA�c�?����ꉿ?���q[ܙ@��ﻵ�@Cw�e@��d�s@�!�Dn�@�\�B�@�ȝ��@����q@\����^@ ���L@"�bu��E@$�����l@&����P[@)�	炄@+l^�8��@-�&UnQ@0Bc���@1���N�!@3��þ@4x��Jt>@5�^p�?@7���K��@9#�~91�@:��BZ�7@<�n��ڻ@>Ai˨k�@@\��1@@����@A���R�@B߯b��@C�^z�5�@D���q�C@E�=��>�@F�L�`@H��(�@I.VxS"@JO3O���@Ku���@L�^�c�(@MҘv�a�@O	2/T��@P"��?��@P�.��j�@Qfm��*�@RIϊ�P@R��n���@S_�#��@Ts�y�@T��Y<K\@Upt���@V%���c@Vݜˡ��@W��4i�@XT��!�@Y�Q9�F        ?����i�?�^/'o}�?�
&تi�?�~�wx��?�FqpN]?�O5d�%?�߁~�@���@	|Wʆ��@װ���Q@�i :�@9��"�)@ ɲ�/to@$^�-�e@(_��)�@,���n��@0�����@3�m	���@6koe7�X@9�/X�lS@<�'՛@@Hx"�@B8\\�@DHh��1�@Fx�h�ȇ@H�Vc�G.@K<҅B��@MЮƄ��@PC��
�@Q��\?��@S+q� �q@T�Fh�{@VXU*.��@X�=�R�@Y�|}�� @[��u��>@]��gnZ�@_yj���@`�����@a͇��'@b�c �2@d,��7h@e)��A�g@fZ�dAA�@g�_G���@h�!�\�9@j"�=�J@kw��@l��49�@n<ƚ@o�*�~@p�FT�_@qT�����@rh?��G@r���d?s@s���w�@t��{?�<@u_��D�\@v<j�<@wE>9[�@xfA(L@x�%��tP@yބ7�H        ?�>/CF.?��8���?�ب��=f?�3���7�?�+8���?����?�c�'�A@ �B����@�t��@��1��@���R@��#e�@t7���@!�>*^l5@%?�E2�@)
��q�@-2��D�?@0�����O@3PX,,�]@5�};�_�@8ɼaH��@;�wx�$g@?��I�S@A9�!̹F@C�:+�@D�3�@F�Mb0D�@I
-H�.@K==.��@M�w�N<�@O��R��@@Q6��fo�@R�^T��M@Sڒ�'c�@U?4����@V�8N4V�@X-��T�@Y�/ᬎ�@[M�֙@\�#�7b@^�2u���@`+��u�@a�=0�@a��:��@b��@c����@d�1���@e��Q%@f޹���+@g�k�n@h������@jr?��(@k4�N�h�@lX�0&�@m��,;�@n�����E@o�U��r@p��g�@q2{ �@q� ���%@r|d^Y� @s%�#��x@s��X�i�        ?��d�i�?�,��[?�LBD	��@ ��H�=@��
N,�@J��7Q�@ �VuK�@&E���@-2,+�x@2�Zۻe�@70r�|�@< �� 
@@ش�� @C��x=��@G1�b�(>@J§�u�@N�u�:I@QV�����@S�K�F�#@U�Z;N�@X@����@Z�$I�E@]���@`*h�`�_@a��(�P@c-�`��\@d�u+��|@fqU�.��@h+!4R��@i���]|@k�ME@m��g�\�@o�q�a~�@pۨ%^@q�?��@r�rS'V`@t3:���@u7u�	�@va-n��@w�N��@x��T�Q@z
��2��@{Q��}*�@|�5><�@}���-�@RQ����@�[��%�@��a(9@��t��F@���E���@�E� �@�	-b�/�@���L��@��/����@�g�}.@�8��}��@�-d"�@���ҍ�@���/��C@��dU���@���1%S@�eX��@�MDű{�        ?�����X?�ҵ�; ?Ã�؀V�?�i���� ?�z�y��V?�A�'�'�?���%��?�nM�O?��#�F�@V�� E@�x\R`�@Fh� @�h�n@﮴!�[@F���a<@ݗ�4��@���U��@!����@$(6�@&^9oq@(ʴm#�@+Wt�v��@.s�A�@0hДv\�@1�r]�s�@3f�h^@4���z@6�	�(M�@8YFos�@:Ee}Jp@;���׎�@=�T6@�@?�J�Yh@@�����@A��@C��W�@D�����@E?�m��@Fhc���@G�cj��@H���3@J�9�@KU �)	�@L��Y�;�@M��"�_�@OS��IT@P[��f�@Q�7B	@Qɞ��O�@R���@SE��Td�@T	
����@TϼF�@U����@VgA@@G@W8��Ȍ@X
��@X�d�n��@Y���u�!@Z��x�@[|���-@\`�8
��@]G��q�        ?���C/?�o�@��6?��	;�6?�W�/_P?��n�D?�T(s�_r?�{����@�m��R@
�e�G��@|脬�D@jz��@2��E�@!H�*7`�@$���e@(�6�N��@-z)�3�@14�2��@3�� ��@6�v ���@9��*O�e@=\�ZXd�@@~���t�@Bm�FmO�@D| �c:x@F��xC�t@H��1���@Kc�_��g@M�2G0g�@PNbiy��@Q���!�r@S+#S,h�@T���ט@VHlԚ�@W�Wz��f@Y�uY��n@[m�O�r�@]EGZn�@_,���&�@`�`��Q@a�UPg�@b�Q�l�@c�O�V�{@d�H�<-d@e�6:mB@g"pi�@hUϜd��@i�k����@j��*l��@l P�5@ms�N�@n��}�;@pF�Y@p�=��9@q�����@rBpu'�@s�<�ć@sƹR�@@t�e�	�@uY�Pv�@v(�����@v�0A���@w�F�c=4@x��b��        ?���Ȏ�?�*Nv�?�?�Ѿ��rW?�B#q9<�?�D�C�u�?�O��)��?�O�P�7@i��
�@ S��@ c��J}@=�3��p@@yndA@"�5 V�@&W�����@*�'��@/?"4��@2-�Ǿ��@4��L��@7���BYo@;3����@>���O�@A0Xk��@C)�+ň@E@P�*�@GvHux�@I����@L>؂IS@NѢ���@P��p\�@R*IW� l@S�gf\��@U*���@V�r��F@Xh^�ѳ�@Z�>�@[�����@]����o�@_���2�@`�;�:ZF@a�Q����@b�"W�@c�'�d�@e �ۢ��@f!�{P�N@gJP�d@D@hz�@�0@i�K[��@j� |�@l8�K��@m�<*7Q@n���B�@p?H��@pϭs��@q�͚5��@r?���t@r��l��@s�*d�L�@t��V�R@uK6e��@v�;f@v�{��Z@w����^@x�1��V#        ?������?�UJe]n?��N��#@�^�dE@��<i�@ ,��"�L@'Hl�螊@/����@4왖�O�@:�G�c>@@�"*n�@D9;�@H=x��.�@L����@P�[���K@SP���@VJK�@Y̸��)@\I(���@_�k+:�@a�MMӐ~@c��[���@e������@g�Y��T@i�:{�B�@lzE���@nz���@p{s�:D@q�|�s�@s��X@t�B����@u��� �@wp�$�@x���3`n@z��z�ܻ@|2x�h]@}�xf@�x��'@��6�Jټ@���D�@��:C��s@��Y!Z�@�{���@�|_�9��@����v�@����Ʌ�@��L���9@���=EP@��/�0
@��:�_j�@�'����@�W\x!@��`�=L@�c}��
J@���҄B@��g+@�K���M@��C9�$5@��@�E@�L�.�
@��DCd�@��A`�f@�e�O�ym        ?���ri�*?���=���?�G�u�?р�|'�?��r��?�%z^�g?���?�}�+���?�S���@��hP�:@�G�� /@�UBN�@kӰ��@@rT�=I@M߷��@��]f��@�B�|�@ dƊ�A@"\c��~�@$p���@&��^��@(�8�b��@+R�Лj^@-Ֆ�cؤ@0:�}��@1�'j�[N@3��N5@4z1G�mG@6 ��at@7�\��#*@94
�I�@:��b�@<�@>eK��/�@@7�K�@A4I�,�@B�]�?�@C:� #@D)KIr�@EP/W�@F!��x�@G839�@HT�t��@Iw[u]�E@J��� �@K��c��@M~��@N>,��L�@O~̍�5K@Pb��8N�@Q�}Q�@Q��$.@R^-��K�@S3�?�K@S�"Ju@Ts�'��@U+�-r�q@U�)N���@V��e�z�@Wc���P@X&��d�T@X�?�au!@Y��ǫK�        ?�<W ��?���k�B[?�D�^S�??װ���`?�b��Q3?�XWgv:-?�(K�@���8�@	PM��%U@��+�a@ep8�G@�~��b�@ � ��vp@#����ϰ@'��ZE�@,�鞃`@0d��Be�@2�'ekd@5��>�@8�؟*2o@;�"(�\@?H(�V��@At�K�"p@Ca�"��@Ej�f~%@G���@I��u�`�@L1w<���@N��-{�@P�8���@Q�Y��{@Sd�9��!@T�T��BD@V`'�	@W�.�/Z@Y�c�P�@[C��5Y%@]<)(�@^���A�@`S9j��@aG���u@bA�Z%�7@cC���`@dLo4 #�@e\"Yu�(@fr�ʇ
�@g�H�aLS@h��)�o�@i����@k�؛,@lKr��@m����{�@n�I}��@pF�g�@p�E�&��@qf�,ó|@rOdX�1@r�S��w�@s���Uf�@t=Lb�@t�:�� @u�q�!s@v��R=v2        ?�?�R�%?������?�����0�?�58a.?��W�3��?� �3��?���{�X@0�;��e@������@V�)�dd@�=��<@E��8O�@ (���@#��\ {�@'Y�AÑ�@+��A�=@0��%��@2�&��4Z@5G`fr:@83�P3�,@;WFq�^@>�wMt@A"Aa��e@C�g+��@E	�Ǟ�@G&�f�@Ia}�-@K�Ӆ|��@N+��@P]�6&��@Q����@Sp���9@T�|!� R@V�Q�*@W��(+�q@Y;:j�m@Z�ᒤ;@\�U��@^mqlŦ@`"�=\H�@a�GIȆ@bh۵-T@c�q��@d!BeA�@e.wmS$@fF=���t@ge؊�aY@h���0�@i�1rіG@j��|	@l.�@mr�2��@n��NP@p�3��@p�9!D7:@qg;�}�@r�8�y@r�F����@s�O	�u�@tP����@u`�0��@u�h��`@v��e        ?�k�L�@?�r��Y�?��Y��J@4v��@pǇ��@m}aO@!����v@('���lH@/�6zq�@4?"�C@9*n �{�@>�����@BW�͈[@E�(b�{�@I:�i�R@Ma�,�@P�4D|�@R��f���@U0��3Z�@W�64��@ZQeE�m@] .~��@` #�֤{@a�]-�8�@c)<W�6@d�s˙F@f�$�+�@hN$	|�M@j+Xj,'�@l�)�@n��~�j@p��<U�@q$���@r=���e@s^�m@��@t�ث��P@u�+ Y�@v�t��@x4
�z�@y}��a'�@z��<Ǣ�@|(f��Ρ@}��5[�@~�/��@�2G\��%@���f��@���5��x@�tZ�r@�=Vh)�@�	���@��k�H*z@��k�D~@���5փ�@�d%��T@�D�Q��7@�(�A�%�@��Bm@��&HV@���"�v@����A�@��S�)ه@�ӭ"��G@���b�j        ?�ݾ��e�?�K�N5l?�nc�<?�,��Co?��%I5�?��d�%E?����o?��%5�?��_���@C�}@s��v�o@]T(/ز@ߧ�Oɥ@�ܕ��l@�g�4�,@\n�d۪@���@@ �;ÿ�:@"�OCsKH@%)�OM�@'t����@)ݪS��@,e��B@/
�Q�	@0�3qH�w@2X.���@3�<�ˀ�@5g\�uLV@7�/@.@8����+$@:n�����@<:,��o@>Nq��_@?�T���w@@��T$�@@A��ε�p@C���$@D�����@E3�!e��@FTgO.��@G|pԅ�@H����'@I��DR0|@K)#�@Lb"�]n=@M�O��@N�1��@P,V8n��@P�g�l�&@Q��f�@RF쮏�9@SY7*R@S�2���@T�w$��v@UE$I�@V9 �@Vس�_�0@W��1=C�@Xyњ��E@YOmǮ��@Z(a)�@Y@[���y@[�1���        ?�����?����7� ?���;�T�?��W��?��Б��?�$��t�?�Kl2X��@K?���H@��r`�@�v�@����@nX5�@�g���S@"�c��@&J~ұ�@*Lv��E@.�~�Vv�@1�G'��@4Y3��\@7'̌C_@:+���F�@=e��iL2@@k;��@B>���r@D.�9��@F9KuQS�@H`{ږ�
@J��d��@MG�{��@OM_�8@Q���@Re���s@S�\�e�d@UEBj߃@V����@X]2�cH@Y��h�@[�+���@]k����@_7��hL@`��姝@a|��?�@bx�G�U@cz�{�@d��!Iu@e����@f�X(��@g��J�~@h좩E�l@j@�E@kJ��\��@l�� .@m�!��S	@of���@p,U�k�|@pև�*U}@q��.�O@r4����@r�9�>�P@s��M���@t[�HJ��@u�޵W\@u�SG���        ?�j�Z�?��w+�"?�b/3�^u?��yZ��?���<?�j��?�?�����@��q�@�@�m�xw�@b�ʒ7�@�&3�N @ms�O�F@"{mqTj@%�8٘�@*���Y@.�g,���@1�t[m�4@4�K��@7�)#�s\@:�ߋϼ(@>S)gv6@A�]�8t@B����@@EB�nH�@GL��zm@I�/���@L	� 5@N��>C@P�h �IE@R���21@S��L�o�@U'�G M@VÛn�@Xo��G@Z,��:�@[��.P�@]��D>�k@_Ď��K�@`�C��i�@a�j~�^3@b�����@d3�(t@e.�G��@fV���@g�nU��J@h�dx�i2@i�m�W��@kF�s�V�@l���>c@m�&��|@oN�r(O~@p[b1<�@qS@ 6F@q�2����@r��_B�@sR�D��@t>mw��@t���@u��J\��@v�y0E�@w_�b��@x9֓+��@yghf�        ?��+�?ܡ��J�I?�]���!@$�2���@e�_�,Z@RWݭ<	@"2�J��@(�'�]�:@0G��u@4�����4@9�=l��@?8ԩ´@B�˒I�@E���"\@@I���1�Q@M�����@P�mxv�@SvW���@UrT�	�@W��᢮�@Z��m?��@]l֗��@`/Jn���@a�[�i�@cW�����@e�	�@f�{A���@h�ۛ�@j����ݮ@lyS#^��@n����X@pO/N;��@qeԒ���@r�Y�C-�@s��J��v@t��f��s@v��%(@w[Xf�Sy@x����1@y�k��� @{V�a�g�@|��m@~(��i{X@��xb`0@��T'��`@�Qyb�39@��oTփ@���:n@�����*@����@�^�{mS�@�:�/��@����lQ@��A��@��ҩ��@��^���`@���� e@��Z�8��@���w�F�@��gV��@��F���E@��So�"�@�W��&L�        ?��Ҧ��?��c��?����f��?�Ϯx��?ܳc.�?�CD&<&?�lP���?�a�I��?��F�oD @���@xb@�^.���@
G���ˇ@B�
�al@Vj�w7@BR�Z�@e��i�@��A��@S�u��@!�=D���@#�oݨt�@%������@'���Bo@*;�7�@,���}�@/:D����@0�u�kb@2T B��k@3�n�)�p@5B�]�һ@6�T��Ƭ@8g�	�]�@:��r~&@;�B�܃@=�%�5��@?TY����@@�d���W@A�/`�>J@B����.P@C�Q,��@D����}�@E�A�N��@F�S�kE@G�×�@H���B@J���@KJ=���@L~˘K�@M��n�VF@N����;�@P!/>㩩@P��[�F@Qqկ*:@R��K�@Rγ�$�6@S��%���@T7�|&�p@T�^�V@U���@VkURB�@W-��(�@W�1�D�@X�-is��@Y�{���        ?�2-J!��?��hd�o?�����R�?�LO9�L?�'0ڵ?�]mZK?�����F@���j��@����7@��
�@N�360�@}y��^@c�T���@#g��C@&��PU5@*�^8��@/R���pk@2r�P�@4���7@7�K�ەY@:������@>x��%�@@�e���@B��7�@D��J�m@F�%��`�@I��vX@KW�s)��@M�b%MG�@P.`���@Q����:�@R����@Tb6�sxv@U�낟7�@Wz��c�@Y���@Z��"���@\�p�R@^b6)���@`!)�%�@a�aʯ@b`w肋@c�b���@d.�����@eEBJ?�@fc�]��@g����@h�J~D��@i�Pa�@k,5e�Ճ@lq��tU@m����p�@oQ	��@p9rZ���@p�8�6+y@q���ȹ�@r]�,�@s�e�Ƈ@s�e�[�@t�E�ݯ@uq3�H�%@v@4'�Ȟ@wI�<o        ?��Oʛ	<?���;�s?ł���A?ַ',K-f?�Z�<�	�?�dl��D?���d��@U]	j�L@����$@ة%"R�@��怎V@�Z��@)f+st@"2P��@�@%�0�d@)x3qxUj@-��[��@1y���@3�(ů}@6-�.B<b@9&�]�@<K����@?:T���^@APC�;�@C"��@E �B��@F�� �@If���u@KC�s�@M�߅��<@O��+kq@Q3�'�UE@R}� 7@S��a��@U5nDckV@V�>"��@Xrm��!@Y�)�M�@[:�d��@\� (mje@^��.I��@` &��o@a��p �@a� �C+@bٶ#PV@c�U4?b@d��5��@eəqnL�@f�3T��@gܾ�z�@h�6���@j�4S`�@k%��j��@lI����@ms�q.E.@n�}:F:A@o��Ә�_@p�Ёa|@q*��\��@q����2@rs�;v/_@s��!�@s�z��?�        ?�H���6�?��ڶ�>?����b@�'���@ࡵv@��5��@!�T��@(w2B�%@0���@4|�A�R@9w"��@?Q�PM�@B���Q�@E�`�ʋ@I����pK@M���n�@P��TY��@S"!|��b@U���Q@X�ބcF@Z�"��@]�BoT[�@`T\��@a況��@c�EA��@eD0737w@g�3�C�@h����Z@j�t|��@l�4?�*H@n�����@p��6��@q�q�O�@r�C���@s��M��@u0X�Xb�@vow�y@w�5�)@y�(���@z`K#�v(@{���od@}+��I@~�^��C@���U��@����T6 @��9�R�@�[��{@�),���T@�����>�@��W�b��@���[��c@����b�@�i**!�z@�N�Jf��@�8(���@�%�/�0@��xE�:@�ʋH�@����^�@�O�q�P@���u�@�� AO�@���LA�        ?�=�V��?���(�|�?�����k?��	�_�?��wk?�d�e�?�:8ś�?�_7���@�T�`@~ف~��@�)^%@�t\Wǁ@�W��9�@aD]{�@A��Ad@B�G|@!�ݮN�@#�UFW@&c�R{�V@(�<�C�k@+��Go�E@.t����_@0�MX��O@2A�S��i@3�1	-7>@5�b4��@7Nbm�I!@9���SN@;�A
W@<�4���@>��}��@@�ƍ.)*@A��X@"�@B�@�K[<@C�?j��@E�R	oT@FB�� ��@G����@H�R{.+^@J=j�T@Km{�$_�@L�	�#wM@N4�z̞@O��͠�@P���t��@QN캙��@RFaQW@R۰���@S�'NN�@Tx��T$@UM!
,n @V%���8@W���@W�k�H �@Xƾi�'@Y����҇@Z�*���@[�>��@\4�b?�@]w	aܙ�@^r���r�@_r:p	��@`:�}{:\        ?�6�ċ�T?���=�	|?�^Z$�ta?�k�"Ha�?���oO?�1 ��?��	u݆h@�X�-S�@	u�b4�@��Ҕ^�@1�'S�@f���@ %�LjCi@#r l3�@'hr�U@+ �^&�@/��<���@2&�\L!@4���;��@7������@:y��,W\@=�6���#@@��fh�D@BH�ss��@D)�/�}�@F$��n�@H99̱,�@JgG:#M*@L���N�@O@�>��@Př=,��@R� ��@SgB[�@T����:�@V;��nP@W�Cͩ�n@YC��D"c@Z��-�W�@\~҇��@^/��^i@_�;V�>@`��I�(@a�p�b��@b�wAz�@c���Ө@d��'��@e�I���@f����G@g�Ϭ���@h�XWΪ @jN}ѱ�@k0���/@l\� �Z@m��B�vc@n�vu�qD@pJ����@p�ZCr@qLaJ�@q�G��i}@r������@sQZ<DE@t5��@t�G;�\�        ?������@?�˥ñO�?�(	$���?޴׭���?�o\�0� ?�
#|�B�@ p�?2/�@9a$��k@w��EÖ@��i�$�@UKv{	@ qXн[�@$(��8@(T�^K�@,���1�@1
gW�@3���+�@6�y�q�@:4
��ER@=ĭ����@@�&@�40@B�����@E�i{@GV��ly`@I�.�J�@Lax:`@O��"�@P�����@R~.�{l@TnӶ��@U�
���@Wo"Y�`@Y9u��Yj@[u�oL�@]n!�+@_|yS�4@`��Qr<\@a�㭢�~@b�m�l�*@c�H��9@e$�(l@fRe7a_�@g�I���@h��?#�/@j; 3g�A@k�@���@m�4��@n{au��@o����@p�㢇�@q��rw]s@rW�����@s*`�6�@t37*x@t�Ү7u@u�]�$`@v���8�@w�6���'@x���]�}@yw��p��@zqҋK[�@{p�F�H�@|t���I        ?��2�_��?�8i{�H�?��:a�b8@敹���@��.�1�@"9�?o�@*�YK�@1��[@7:��'@=}��J%@BE>���!@F1�)A��@J�P�:Z�@O?����E@R0��"�2@T�=;>O@W�u����@[CW9��@^x�����@a�|e�N@b�X��j�@d�!�h+@f�Nƹ�@i)A\*�l@kqc2�@mҙ�n�@p&fJU��@qo�/4E+@r��Aw@t(0�L��@u���I�@w��e?�@x���(�@z+����@{��W! �@}u�
�`�@,�ѳX�@�w��lf�@�_^�6@�L��B_�@�?�av��@�8����@�7��#�@�<�IL�b@�G$	���@�Wl����@�mq�$�@��.� ��@�����%@�Ѹ��@��y�1�@�0��М�@�4m��@��7�/@�t��@<�@�'��x�@��IB0E�@�j-���@�ҙٜ@��3g���@�xL�=X�@�-KI@��h�3        ?��H:r�?�Ģ�m=?�_�[�M?�d-O��?�\v�>��?�7� /�?�<�'?����@ �,f_y�@>����t@
6Z�.<�@�^p��U@��,`P@%8h�N�@���g�:@�E��l@ �C��x@"�����@%Eψ���@'�j�a��@*K�e~�@-�kv^�@/��3,��@1l �*T@2�97��@4���M�@6MAp�@8� �`@9�`e>��@;����@=��헅,@?�ۣd�;@@�n��U7@B�1���@C �<��@DE����E@EtV�Z�@F��;�(@G�M6y�q@I2ThN3>@J��T�>u@K�$q�t@M=�
F�@N���
\@P[ƯR@P���;�@Q��ڏ��@RRY�07@SG�W��@S�O�Y�@T�k��4�@U����[@Vl�ESB�@WKH��@X-7�&,�@Ya O�{@Y�w���@Z�q�;n�@[�G�`�K@\���ǀ�@]�e�u@^ɚ�u/@_ʅ���        ?���t�?�s�#*�?ɶ}��?�$ù#w?�X�����?���[��?�fU��ZH@�\K#4@K��
��@���W��@Ż��L�@���ۡ@"@��?�@&�_���@*G�k�w�@.���}��@2��pQ�@4ҭI��@7�c�j�@;�Q�|�@>��7���@A,:�8�@C*��=�v@EH�}�`�@G���B�4@I�.���@Lc���@O�\���@P�k���@RP�5�i@S�q�H�@Ub��I$@W?%{�@X��#J�@Zy�,uƉ@\M_Bu;b@^1��3�@`�F;�@a�u��@b"}��t�@c6��l�l@dSH]�S�@exz�J�T@f�>=��@gܘ'�n�@i�K-ҵ@jc%�,�@k�d
o��@mMcj��@nm�wgR�@o�3k�@p�����@qc{��i@r%�"��@r�X��I�@s�X�{�@t��URI�@uZ|��{@v2�ݻP@w+b�g@w�9g�:@x�b�5W�@y��f�        ?��ýb?��� ]?��^�7��?����Z`?�缏O{�?�k_��?�\|���Q@����5@
���@��4'-@h�~��@�9�-�@!dY\�@$�����]@(i7Q��@,�V��T@0�^�`�@3-�'�1@5��,p�J@8�&�^Lz@;��ʤL@?VM��~�@As�w]�@CWC�Wl�@EVm�.�@Gq(ZO�1@I��>�D@K����4@Ng���[@Px�`tB�@Q�y�=.@S,8���(@T�胼��@V�1)�@W�0T�~@Y:����@Z�����5@\�F4�@^Wo�:m�@`�}�@a���j@a�v�@D4@b�+LQ�@c�� #�}@e.'��/@ft\���@g,��J��@hKv^:�@iq*E���@j��k�".@k��T2e@m
����@nK���~@o�͞p�@pp���$�@q��~$�@qȧ��j@ry��|�5@s-���@s�D�.�@t�nE&$O@u^�_�|@v��m        ?��?�$s?��곈d?��7��Ŵ@������@ /�l�F@ *�)��L@'04���@/�����@4�>&=l@:I�6~q@@L�?�@C�h/t�@G�^���@K�K��n�@PCܘ�
@R��MM�@Uk����@XFg�U�q@[P��<��@^�#!]5�@`��.4:@bǚ�#��@d���	@f��N!pJ@h�d̡�@j�1�-��@m/ީy)@o�]kE��@q O�q@rFG�n4K@s�]��@t�����@v^�+�cq@w��V�x@yT��N>@z��X�@|y�K+�@~�]�!u@���p�@�Â.�@�����@���w��@�~���@�s%��@�mY˚�@�m1�X�+@�r��}��@�}�����@��5kz�_@��<(m�@���zTWS@�������@��ޟ�\@�2\�LM]@�1���8P@�̚���@�j3A�_�@�
Y��r@����I@�R1��r@@��״��@����;��@�Pw&�[        ?���^6�?�DU��s�?�视�֚?���M�l?�3��3�?�`��T�?�+7(�b*?�aٻ��?��0I���@J�h�j@�gp}2@|Ijf	w@f��w@L���H@p�t�rp@ҏ��@r;�@ ��U�&@"��[��@$�"#��{@'+� ��\@)�h���@,�(i9�@.�O�9��@0��tA`@23��r�@3���-M�@5BRO�,@6ߣC��@8���MӨ@:E��`��@<���}@=�:J4�@?ʰO�f�@@��?��@A�(޴�@B�T����@C�E���n@E�oͤv@F$7�>R�@GFe!L@Hn�_u>@I�r�}	,@J�ƶ��|@Lw'71@MPv$�2P@N��'ض@O�0�:K@P��Mtr~@QKR����@Q���p�x@R�Bt�]@Se�V*�I@T7kw!t@Tۤ�:��@U�
�Q�@V]G��u�@W"tQM�.@W�|�4@X�n�ŝ@Y�2p�}�@ZSʙô@['17���        ?��'���?�"f�R?��E�?�~Iu �:?����Z�?���>?�;�n3@�L����@>u<o@�>��T@:�}��@��e�@!Ұw4��@%�����@)�N���n@.rǐ��4@1��.� @4���� @7�|m �@:ׂ��&�@>W��@AS��h@C
B��8@E(� �n_@Gg�	��@I�Y��v2@LE^���u@N���&��@P�LeMݸ@RByG���@S��R��@US���@V��a�`�@X��ݎ�L@Zg��7y�@\9T��@^Y�/D@`�Q�*�@a�)h�8@b4��͵@c"~��f@d;�D��@e]B�@f�g�wdL@g��c�d@h��=w<@j1��;"@kz�RT�@l˟�l��@n$1�%��@o���0�@pvF�%l�@q. 
!L�@q��c	#�@r�93�2�@slk�gz�@t3Ye|��@t��-�@u�I����@v�>.��@ws�K}�@xL��nĽ@y)��V�        ?���kV�?�I��;P�?�2m�l�?����?�j�qZ	�?�5Q��h?�mw����@��xs/�@
�|��@�=-Z�@��C�F�@YN�(@!s���.@%$?H�!�@)A/���@-�<MG�@1efL���@4�86�@7c�`N�@:@c�9�@=�����@@�@N�+@B����@D����#@F�M���@I0���<@K�;L�r@N1)���4@Ppn߮cO@Q�3u�}�@SO�u�Ҡ@T׌�!@Vo#G|
@X���C@Y�7؆r@[�d�V�@]l��V�@_S�q^A@`�{�v�@a�R���?@b�X��@c�'�$v@dඌ�k�@f�H��@@g,�fb:@h^���M@i��2�#�@j�g���@l ��!G!@mpaCK��@nǍ"��d@p53:Z@p����@q|����@r6�:��@r��c�J@s�Y�ș�@t{qx��u@uD�p�@vN�NB@v�
P���@w�HV�N@x��X�        ?�j-O;/?ۓ��?�;I"��@�4|�^@6�zy�@0-�HI@"4�����@(�_�n@0r���Ю@5b�|��@:)�-��@?��Cԫ@C#���Ͱ@F���4@Jj*��S�@N��-\^@Qt�u�^4@S����2@VP" U@X��w�@[��� =@^��p�@`�+�aV@b�z����@d@.��!@f�����@g��p���@i�ы� @k�+���@m�����@o��VY"@q`f]�S@r<�^+Q�@si5��;@t�(��N�@u��T���@w"S��@xqG>���@yȵ���R@{(��	ާ@|��Dl��@~26� @y�h� z@�}S����@�A��K�@�
5���@�֡���?@�� �D�f@�{L6���@�S{��a?@�/�!��@�e]��u@��S'�v@��u����@�ŕv�X@��cD�:1@��ֈ��@���v��@����dN�@���YИO@��y��@�@�LXTy��@��.բ��        ?��-#k�0?��w�N��?���{��,?�X�(�?�1z�E��?�V�ף?�+$ j#?�;��X�?�ɺX2s�@@��m|@�s%�9+@b�E�,@T��ȑ�@4�8��<@Q��QH@��'# �@C���@ �фC��@"��H~�@$�n ��P@'��6V@)g�o*"J@+�W��@.�LL���@0�۷�`D@2�O�@3�ds�2�@5&&���@6�-�	@8qo$P�@:-�,.�]@;�{ o�=@=�,�	��@?�����@@�Ln���@A�G���@B�O:pH@C��0��F@E��~A@F8-�p}�@G`��"��@H��7�n@IǇ����@K���@LJ�$�@@M���;�@N�f@P!��U�K@PѾ]�X�@Q�:��O@R;�#Z��@R�2gR�@S�;a�A@Ts��Ϊp@U7*��ޛ@U��ȱ�m@Vǆ@A��@W�DU
<�@Xc����Q@Y6�T��@ZH�1I@Z��Y�@[�dlB        ?�9���V4?����{�?ȑ�p~?��)�dH?�"�2'?�Zȩ��?���ʆ�@}�fE��@��?�#�@y�}q�E@��s�`@��o�<@"b�/��O@&L�!�NV@*� �E�1@/�B>@2m�Gk��@5W����@8��v�@;��P�2)@?��\F�Z@Aɾ��@C��p7<"@F$�~
hM@H��mw7�@K �5$@M���|�)@P@�2S�w@Q��)[Y@SCJ�9�T@T�˽�L�@V����e�@XO�g��@Z#�>@\�YCGH@^KЯ �@`����@a��w�@b-5J��@cNz�U�@dyNij@e����5@f����U@h2$	OM;@i���J~@j�qa��[@l?���=@m�|/���@o"�noC�@pQ$.Y�a@q�9b�@q��X�4z@r��YW��@s{�[��@tV�X9W�@u2�6�U�@v��%��@v���@w���%h�@xѲ�Ҙ@y�0oq_@z�I� �@{��4�;�        ?��r�0*?�ă?�[�?���z�G?�O@%�?�Si���?�p�0Q��?��"�=g�@ �.��J@��<q@hz���
@��`5�'@yR�.F�@��I@";>�9�@%���g�@)�3O5N@-��pwI@1NWЏ�H@3�#̫]t@6�k#@Um@9z����z@<���C�@?�.���?@A�c�&@C�=�\@E��<�dP@G�Ms��@I�z��Z�@L��@N{&@D��@P{ԛ��?@Q�OMOC�@S �w��@T��2D_�@U�}J�@WyK��@Y��@Z�X�p��@\I��|�@]����[�@_�چ!�@`�kP�U�@a�l�k�@b���l��@c�����@d�YZ&G@e�<��b�@f���+hp@g�F3Wd"@h�c����@j���j@k5�l���@lc�$(��@m�s��@n�Iը @p
7
�	@p��5~�@qT����@q��4�Q�@r��q	d@s\�$� @tqd-X@t��1\TW        ?�&�7�F?ڗ���m.?����)�@Lԝ��@����&@��gp��@!�]�G@(V��u�@0��f@4w/�E9"@9{+���q@?��f@B���t�b@F	�2��@I����)�@M���]ӌ@P�U3nq.@SJ����^@U�҄n�@XU�)k�@[~�q�@]��3~@`���`��@b��@ݭ@c��[W��@e���g�)@g`~��I@iG�^1>�@kA�0��@mOBoI��@oo�YO��@p�v��2�@q��Oޛ}@s!��@tW 69^(@u�E2]� @v��WT�C@x0���`�@y��|��
@z�:�a�j@|]��'��@}�W?W@S�b*�@�nN��v�@�7/#U�@�@_.@����D!@����@�@��ގ+@�dK3�eW@�F�<��o@�-�4�%�@��^���@�n�,_@��N��ԯ@��q�@���_�r^@��X�[�@�쫏A��@���a��@������3@���ɶ�n@��7�	�        ?��h�L�?�z�#��J?��T!���?��ao�J?���,�?�O�9g�	?�
sA�?��\�YN{?��EJ���@,�nI�J@��N=�@P����@L�Sb��@.�D���@M�@��~@���x>@D�Y�t@ �<EN�.@"���vc�@$�`X��@'
��:�@)q����@+�X@FX@.��j�Dn@0�W�F�@2 i�k@3�,BsLo@5/xQ�
@6���Ə�@8{�:�ò@:8k��@<6��s�@=���[e~@?ȏ��X@@�w6��@A��̎�@B�̫��F@D ��z)T@E.�0f@F:��&8@Gb�W�)@H��S�s@I�v� l�@K@�0�D@LGG�Xk@M�Ќ���@N�|E7�'@P �OHS@Pͨ�{}�@Q��((�@R7	l�I�@R��4�@S��5,K4@Tmօ�i�@U1DTZ@U��SV\@V��s�7q@W���Vt@X^����@Y23�Im�@Z�Dg@Z� �w� @[���K6        ?��$Ȋ��?��z�!�?��rn��Y?�\o��Z?�/�dG?�?��ÿ?�	"�)�@��
��@	d��g�@��V3�@�Um&@}�o�q@ �>2�l�@$0T�1�@(��j@,w6��@0��-a{J@37�۴�@66/�1R@9�6`:�@<T��D @?ѷG"�E@A�i�T�@C�T�!�@E�ɥ�#@H��5��@JYތ�8�@Lɲ�L�@OWz(�CQ@Q��+ �@Rf���ծ@S�l!��8@U]U���G@V�>`�+@X�!���@Z?��@[�����I@]�_7蓉@_����LR@`�
d
��@a��/ <@b�Q�a[g@c�鈹D�@d��^A@f��'5@g%�֎�@hM|&�Q�@i} ��Ҥ@j��x[l0@k�?��G@@m5���@n����iI@o���)@p���^��@qF�}G˅@q����@r��8l�b@sk���@t)�Ω�@t���=�'@u�x�CR@vw\�y�O@wB�ѽ�        ?�l����?�t����b?Ɩ��:�?�H�~�u?�f���?� �0��6?�3��q�@l�V\@
���4�@�`@a�@�})��@_͕q��@!}mu��@%6>��{�@)]�p�iY@-����}@1��`��*@4Ch�� �@7AJ-A@:|C�N@=�1t-"@@�;�g�@B�wJ�X�@D�}�i�x@G'��a@I����=@K�:/,��@N�,0��&@P�Q?<�)@Rվ��n@S��49m�@U'����@V�/Q��@Xv�^>�@Z6ʦ��@\먄�k@]�6)�4�@_ם�\�@`�
�)g1@a�G2[09@c|vy�f@d�O���@e<���e�@fd�5�[M@g�]?ުw@h�����@j5I[@kR6�ι`@l��-n��@m�2@�H�@oU�m@p]D�G@q��(6I@q��B!G�@r��g�J@sM�q�c�@t�6ku�@t��AC^�@u�_YO��@vx�2�n@wLeu�q�@x#��O�j@x���"��        ?�hV/h:?��m�X}?�C?�*�B@ ��|vB@���я@��6�?�@ W'�F� @&s��6�m@-�Ф��@2�"Q�� @7�<���V@<Şڄ�@AAh��X@DeU�<Y@G��:�@K8�@�@Ou��u(�@Q��<�@Tx�4Nk@V~�~�@Y2J1�@[�h��h*@^}f��9}@`���Bߟ@b?���0e@c��X�3@e���o��@gBI3�ͼ@i ��@j��{O%l@l�}��ձ@n��/1o@px�t�+@q���9�@r����(@s��_xD@t���`1@v<N8��@wVGټW�@x�.k��@y����q{@{0R4���@|�uyor�@}�;��mN@O�F�P;@�_8h©Y@�^��m�@��4��d@���#��@�a�E*��@�+�:]D�@���{.$@�ɗ���@����P)@�u��� [@�P��@�/��AL<@��N${#@�����@�ߞ�!�	@�˙
/�Z@����z�@��U�a��