CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T114134        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?�Z���W�?��g�@ ��)��@+�jQ@B}��2�@&V�]��@/��V��@5GN��8�@;���ķ@AC�Z���@E'o���@Il*Z�U@@N
Y@^�@Q������@T<���
�@Wş
�@Z.�!
�3@]n֙���@`onS��=@b?\��=q@d'BkV�@f'!+�r@h>�"�M�@jn��i�@l��,"@@o����3@p�v��b@r�B��V@sd����@t�#�&G�@v4Y�^�P@w��ӊ_�@y7Ԇ¿�@z�n7��@|pw�3�@~!P0�@�X6�&;@�ղ�L	�@�§`�O�@���O�@���f��_@����	$�@��ދA@�̓qt�M@�屦2@���_�-@�-Uq�<�@�]��t@���� �@��ez6��@�G���@�7�.��,@��0>]@���5B�@�M��j�@����+R@�Ǝ�n��@���{75@�P�6��S@���
�%@��hE�@��-�բ>@�����        ?EҬ�b�?z�N4���?��K4�p?����<��?���LM�?�]�@+�?�*����?ݠ�e@?�sp�r�?�Ca(�@ �}�)�@
�c�z�L@�.�v@ �&���@'�0�~=@1B�D�@8I�E �@@��¿��@Fi��~�(@M��N �"@S��В@X/��@^4�<�t�@b��4Zl@f�H.⩅@k
 .�i@pM��@r��F}@u�:Ҧ[j@y9� 
@|�?�V��@�+�]��@�,���*q@�LѪ��@��,͓g~@��c^L�r@�e4)A@����@�a:&�u�@����Q@�W���M@��6Sf�@��ǳ4�~@�a�˲@�<�^�W�@�1��P^@�?��) v@�5"���n@�Yo�-��@����)=�@��dT@�*���o@���b&&@�KnW:@���1al�@�Z��\�@�"�G]<�@��*3�\@���J�[�@��E��m@��U�Pr�@�����@�(�<C1        ?'�WsX��?X\N�M�?y���?�?�9�?�)��
y?��C���?���
?�i8A��?���X�?��T	9JB@+U��@�)�{��@#��c�7@&�B�H��@1* b	@8�G>�e�@A��2�L�@HSp��#�@P^ʎ�v}@U�w� ��@[����)@a�qY2n@f34�@kje!vA@p��F�@t)�ñ��@x��.@|w;k)<@���t�f@�l�h�FV@�r�ϗ��@�ǒFMoT@�o�HN�@��&�w��@��wv�B@�I(]�n@��n,�{�@��I�;�@���n`[�@��"���@�Q����@�A1��z@�W֒�h@��r�1J@�=��-@���H��:@�4����@��!aOn�@�NH�_S�@��c�)�@�؆.^{�@��)Ɨ�@��Ү�Q@��[l�@�h!�G @��Mӎ�@�@�,��&@ãFȨ�@�ͳM�@ƣD�}@�B�@��@��&��d@˿�����        @f���?�@�þd�0�@�����@�	?U�L�@�o�g{��@��m!�n@�:z�/g^@��=��m�@�-�	u��@�N�屭@�S�q��@��3�s��@��=���@����FSA�&S�BAq��U|dA�#�/��A���gAABd��A""A�d�A� ��>�A#��~/�A�b38��Ayn�VU�A<�}/cAW��/A��I��A����A��?�A �Ӛ}�A!�{��g+A"�@q�-BA#�=�Y�A%DN���A&:j��A'{ފ���A(�۪?��A*N��A+h�}݀A,�W΄A.b>Q��A/�G�(��A0���q��A1�Pc�<A2W���pA30O�k;A4#zq kA4�fKT'�A5�B�(z�A6��� d@A7̓��cA8�y��  A9�ژB��A:��vb�]A;��g���A=�'�w;A>E��KEaA?u�]�/A@Vӂ�qA@���O�^AA�Fxe��ABA�	)AB�.%�        ?k/�4ʔ�?��l�ݡ�?Ɔ��o��?����>��?�1���?���;,?�:����{@_p���@�)�H@&@�O���W@�ݕY�@�&i�."@�z'�A�@tw�.@!�W @$�D��)@'B�4�@*3���z@-U3O��@0S�C��@@2L6?�@3�8�*@5�� �V@8��+�@:A�v=�@<�:@U��@?'gLٍ @@��� d�@B]���m@C��c�g@E����@GJ��D8)@I'�Ը�@K#��Bcx@M>�P�F@Oz�,�6@P�F�@R,I���L@S}��W��@T࢝�M�@VT�i铭@Wم�~K@Yn�).<@[C�M�@\Ƌ�;8@^���Զ@`,��i\�@a뱯e�@b�ϡ.@c瘍C�@d��:f�@e$�9~@f;��@gY����@h��ǔ��@i�؍�w@j�P(^@l*!���@mr�
���@n�7��@pF�FD@p�,���@qnlA�Y        ?Č�ϊ�?a<�,�7?�V��,�?�u�BFmx?�lmR�y�?�Q:�Gf�?�b{��8?吻h��?�O52��@ �����@e���<@;�?��@"g�	١@,<���@5v����@>^S8iD�@E[�U��@ML
ٷ��@S�BҢ��@Y��$��@`�ŻvS�@eг�u�@j0�}<_�@p�!+m�@s��%(��@w:��=@{�Ӷ2��@�u��}Eu@�;ۘ��@�M����.@��+Ջ�B@�d"dǑ,@��]��Y�@���Tw@�Q�J�@��r�+�@��]3�w�@���j�|q@��"�jm@�@�o���@�!�R�@�$��L�@�J�H�l�@�����@�ɗ�y@��ʇ��@�-�w�@�����jw@�+�*�@����6~v@�)n�.�@�KW{�W@�/��@�+ �*XZ@�?�% �I@������@��$�&�M@���5�@�L+&�ԝ@řńld�@������@�a�0�V@�ۑh��h        ?Q<j�l?�*��Ņ?�-�L�z?���[*:v?˽����?�~���!?�?�m��7?�w�CmFo?��m�rN�@�`Td�@��5#��@��oY��@$?���p@-�(֫@5��B'@>T��*�@D�脚}�@L6(�qO@R|��s�@W�2���@^�$aN��@c;��Urc@g�m(ۣ@mC|
n�@q��&�8�@uTG�@yi�P�@~gT�@��9���@���HS1�@��x�Ws�@���^<Ze@��ݛ�@�,�dYk@����E�@���ï �@��ȨBu@���tA@�ռ+%a�@��P��0�@�	��F?�@�j5[��@��gy�j2@��}l�\@���ZV��@�{׏�'�@�5E�R��@���C@��7}@� �œ�(@�]�0�@�����b@�!{1U�@�v�c�;�@�����J@�[/�p@��D����@Ǐ�}�oM@�H���@�.�c/,@���LO�@����m�*@Ёx�UJ�        @(�lɶ@eլ�c@����8��@�f�t��@�!��e�t@�L���a@�����@�z/X�	�@��0���@�,�別t@ϻGq��b@��iS�
@�5���;@���A�@ݲ���a�@��ɘ'c�@�5o�M�@��1`z@�;�rʖ�@��7k@�]���4@�Q�r@�T��7�@�-�%n�@�)�`k�@�Ls��lg@��Y�?P�@��#�6�@����0�AI�[��A��Y�&Aw;O�yA:�
lV�A��-��A
$�4x�$AM鼂�OA�/��pA�I���A�����A7f��6A��㾱dA5v�gA�ۥl4OA�����AD`l��\A��-��A��A ~'���A!��h�ZA"��*�FA#�����uA$Ȕ�0+A%�r����A'��/�A(S�A�X�A)����q5A*���:aA,n�b`mA-l�=�A.�ޖdA0�6��A0�[��\A1k��"�        ?x��?���%t^$?�Tҝ��y?�pC�j'?����U�&?�ð�@��&�q@:��5/�@�z����@�aq���@��R�Ӽ@!ld��	 @$���%��@(�s�TP�@-G�F&�s@1�:��@3�q~��@6ss��(@9z�"�~�@<�[�t%�@@*�k��@A��ǀ�@C�ǁ�>@E�y�2+@H�q%@Jc�TՖ7@LΑ����@OZ}��Ǎ@Q@]��@Rl�@C�3@S�8��?@Uu�^��(@W:��j�@X�I��ƍ@Z�n��H@\y0��G0@^p,�$@`>�!�p�@aP�b+#F@bn�Ah�@c����H@d���K�,@f���?@ga�� @h�6t��9@j)��	@k�J� G@m([���a@n�/r�\t@p.�)�q@q�@'��@q�y���	@r�x�В@s�Ϩ	z�@t��C�&@u�B���@v���7c@w�줞"�@xѤǲ@y�L_��@{=��~@|H��_ @}��Ue�	        ?=����^?~��o
�?�����L?���u�?�t�A	H�?�]^�?�t�ݳI?�3�Q�'�?�$	ʓR�@ ��q��(@Ŏ�2-@�@N}F@ˑ��:@"Êv��@*�]>��@2�.ն�t@9��ίaO@AubX�5@GO�q\l@N��	c)�@S�z!��@YFOT�5@_�ds�	@c��CV��@h+Gn&@mK_V�@q��Ma��@t�[��\~@x��@|ɦ]X�@��$k�@�R����p@�4�Q9��@�f/c#��@��q����@�h˿ �#@���$0D@�殃 d@�y�����@�I��0@�Y~�_b4@�V_^U�@�#'+��(@���O�\@�+�P���@�j�H�N&@����)eW@�cA\�X�@�$="@���?J�@����{)@��~�@�o�޾Ȣ@�C�Y���@�1w�ǣ�@�8��A��@�Z �x	{@�J���֍@�v��Z3@¯�f�o�@��g�o@�M>��@Ʊ���@        ?b�S�}�?���@?�n�~��^?ݿ��'Bj?�5���f�?��f�w�@��)@�@�b4�p@�A����@#�h���@+5�C��@2�ƶ���@8���@@���B�@E��.7@L��z�	@R�d>i�@WȆ��( @^0��/�@b��e��:@g���%څ@m_2��@q�s��@uut�H|^@y� 2��@~��aGG@����@����@��h����@�X�v��@�E����<@����f4@�p��@��V�N@�Ϫ�1��@��(�Pe@�����@���ɫ�E@��49�{@���cf�@��w��C@�p�^9W@���>�@�]�Hyc@��uM^@@�P-T�w�@��pdRO@����J�P@�PL��@�#���@�
R0�u@��%�x@�
�b%O�@���_O�@�:�e 6�@�c&S>@Ė��~ө@��3�� �@�~CԴ@�u�$h�l@��s�@�G��j�@��Ŗ�        @>��5b�0@u]Not�S@�����6�@���Ot`�@�5D.�m�@�t/8T9@�(����@@�݊(
@۝�� �@��q+@�!�����@�)�Ʋ�h@�j'5]��@��Zlx�@�@{�c@���^��@�&ڱ�S�A����ALg!�?(A�Ӄ�x�A	�#u�KA��Y�+�A�azd�"A�(d�VAN�pA$�T��A����A�0��A9ĩ�AqWn�*A �iA!m��>A"X=#��A#��� �A%ya��mA&kg�ca�A'���q
A)f�� ��A*��ήaA,�C�'�1A.K���EsA0Ć+ �A0�A/A1���B��A2�8W%jA3�6���A4�E�!�A5��q�ĨA6���W��A8�	au5A9"{Ji�A:Dߴ�ϥA;l�T�qA<��%}]A=έ5��A?��CA@%	��@sA@�L_-�AAq�%>�8AB9��oAB�����AC��k�~�AD?Ŷ�~�        ?gA���}?��P���?��91���?�V�x`m?�s���Y?�[��}?��5��@6����@�l�qu�@f��-�@��bm6@@^k-^u@!� �]��@%���n@(��,}�@,�
{��@0�EK���@2�?�+��@5�F��X�@8W`� �6@;P8���@>|.����@@�àԙ@B�S��B@D�%Q���@F��(("�@H���m�@J���Vd�@M?a���@O���>z@Q!��@RzD�S�@S�S�S��@UY��|�@Vߒ̣�@Xsž�Α@Z�I�D@[��<�d@]����,.@_K�����@`�j �0C@a��}���@b}:�4@�@c}�ݎ2�@d����B@e���g�@f���o�@g���%�@h�A�?�<@j!��4�@kY6��=)@l����@m�+.���@o1\M�M�@pD�u��@p���1F!@q���D�@r^��f�@sOA�H@s��DZ@t��>�@uXᗚ�]@v�2]�        ?Z=XI�i?�a�B3?��F��e�?� ��J��?�Z&�}?�d/Y%�?�s� �]1?�>�q�QZ@��8�&Q@}�9��@j�G)@L�$Ӷ@&���@/���
@5��	�C2@=��aS�@DV�g蝐@Kh��项@R>8��P@W�i�ːY@_(���@d��މ@ih�ǚ�\@o�[�a��@s�5��@x�����@}�D�$��@�)C�!\v@��K��q@��с@�V@흅@�Kd�q.�@�v���6�@����@�E]i�+@��/	/]�@�T'�
XF@�$h芺@�Cp��l%@�����@�B%d�+ @�X��ܵV@����"P@� �����@��G�a@��H5��@@��8ָ@��1���2@Î���<@ŊrQ�]@ǩ�茪@���G��@�V�0�1�@��'dM��@��+p ��@�<���4u@ӿ̺5+�@�VЩo�@�7h���@��&#O�@ږ�p��@܀���@�~,y5|^        ?Q�/?<���*�?`���(�?xĠ��zu?�O-�7��?�I�|�X?����}3?�[u:n�e?�S���2?�Ya�[�?����h'?�rl�A�@a�L}�@u���x@Л$z@$�ZW�\�@-��PQF^@4���6�@<WA�t�@B����@H�``��i@P�b&��@Tw�&�K�@Y�${#@_ߏOV��@c�!���@g�dhj@l���5��@p�d����@t/��S�@w�h���O@{y��o�@��Ԡ�9@�Q�,9�@��%s���@��Н;jy@��c��@��(R*Z@�1�Ĉ�@�BA��#�@�~w�-J@�誑��N@��&Q?�@�PV/���@�)eL���@�Ɲ�1�@��C���f@�Z�1�^�@�T�O��@�qU
��@�����v�@�����@�R��Ua8@��Ҵ0L@� ��ku�@�����_�@�J�)��
@�9���@��<�Oh�@�� �Ϭ@�����%@�]_	x3@�(�U�-        @w�VA��@WP�.�7@y<�<�b@���_��@��lui@���6�E�@�}s��W@��I(j!b@��m���@ƪ5lڨ�@�;����@�3�mY�@Ԗ�OO�@�I>$�o�@�O�Θ�`@�VN+��$@�#s��W@�=E�+�@���0�x@��e���@�]�ԉ�@�Ye��I@�P��@�iI.�HD@�q��W��@��s�ZV@��^;�b�@�S�!(��@���-AO���b�A�YĹ?�AB���N�A�A+p��A�{+k�A	DL�ANZTZA��?�A��PM��A}c�~�A���dsJA�~rc�A�8:�NIA��ц�A��KKARR֞�A��ePA�āL=A?6^�	A��dјAԀH��A�,9�i�A ���k�A!S�fF	�A""���M5A"��$%�RA#�EAiȉA$��p�A%����A&{% ��A'g�	��-A(Y6X� A)N5��"A*GLv?ݤ        ?���`��?�%
b���?�

5B?���Q@#��Y@Y:43@t)����@!�[r5�@'����0@,��A�+@1o����$@4����F@8%VB��@;� "KCN@?��`qZ�@A���=FM@C�?ŝk%@E�`�@H&4S�,L@Jp�#T��@L��R�yt@O?�\b�@P�1rxk@R(���G�@Sx3֩�X@T�'�g6{@V)�__֭@W�L��7k@X��A�H@Z]���B%@[�]���@]D�a��@^�
�^�@`!��2@`���1@a��Z9�@b}6�:4�@cN�k���@d%r�m��@e �H��+@e�J��@f�͐��r@g�o!�#@h�;��/@i�G��Ec@j���X�C@k�Іr��@l���(b�@m�]M���@n��ޅ��@o�����@py-j�t3@q�_r�x@q�l����@r@�V(>)@r߿��@s�"T6�N@t(I�@t�����@u��W<@v1��*bN@v�G�O�@w����F�        ?�~��ѯ�?���E�)?��5���?�DO���@��o�X�@�!n���@�z[?T@�2,�"@#�z�}��@*T��!j@1?s,5�7@6�Y�K{�@=E^�-h@B�C�T�@Hs��&�@O[��@p�@S���)0U@YM!V�E@_�$���@c���\0�@h����o�@nVz#Ǎ@r��(�e�@v��&k@{#�}k��@�>�� �@�PHg�^n@��P>�@8@�����g�@�6&cs�@�����@���Ri��@��&���@�F�f��@@���Y�H@��A�@��C���@�3��1�@�ߏ;$6D@��}�@��#��@�@�8(=�M�@�m�aI@�%Н�]�@�\��C_�@���$/c@�V��.�@�Br�u�@�]0�af@§!�!�@�]�6��@�1�ʊ @�$r+l�@�7��́@�jR�r�@ο_N�Uf@Л��N�r@��e�xy�@�I��Ŗ:@Լ���u�@�C���c@�ޤ�	�@َK7!�        ?L ,�!�?���Q���?��!J���?ʸ�����?�(���?�#3��?��B��?���J�@����$�@���*{@�-��_@!6hz��2@(��}`�@1ý1s�;@9����@A]�.<@G���&�p@O��ڇ�a@U&!Y ��@[�j����@a˫���m@f��{��(@lv����@q��(v��@uɳ��@z���	@�:�*k@�F�K!��@���e�#@�&��"�@��,x�U[@��<�Z_�@��jTpA�@��k��@��5�ې8@�f�b}@��"�ϒ\@��1�@������0@��oq:��@��'�c�@���;<"@�_���,@�HG���U@�N����@�r�@��ltBD8@��ʁ��@�� y�@��p1l�@�e����@��\�5�O@�6D��A�@ƮoTq�]@�/�ƗI@ɹ�z�fD@�J����@���q�@�~�%���@�E2�@��v0*��@Ѷ�;=S@Ҋ�]oD�        @R7�@�@���GD�@��g��	�@ƀWN[r@ԯd�}@�@~4�k@�)x�Y@��"���@󼿥�*@�YQI���@�C`��IA8��YKA����A�g�]��A	���X�A��U7L�A�u�m�A�S:�1A2a�i�lA����PMA�a�2A���#�sAe�^��"ATF��AP ��4�A ,u��E$A!7i&�yA"H���VA#_���A$|�@i{A%�P�� �A&��!��A'�W=��#A)$���PA*Z�Hn�A+�l�� �A,Ԓ"@��A.���E�A/_pl�oA0UQ�~�PA0��lrS?A1���ڲ|A2O�v�
A2��[�y9A3�j{^6A4Vam-��A5_���A5�X���A6fI_�WA75=�uA7�&"HA8+�pBA94U}��A9�D��A:�dJsUA;[e��&ZA<ë���A<ь$`A=����7pA>M�>��MA?�[=l�A?�͓x�A@K��s6�        ?s#�Xӳ?�tJx?�xj)E�?ޏ�ϗ@�?�g��H�?���`v�@ ����%�@��Pܯ�@qK�&y�@������@�k&M
�@X^B�S�@ #zX@"�*�%^@%���M@(����{@+�u��
�@.ܴi��;@1�m���@2�X�%@4�}y��	@6� ��-�@8�����c@:�<�+@<�0}���@>�+�#�@@y��$�@A�;�ʘ@B��p�>@C�๜� @E@#�N�b@F�`�v�@G�`���@IEٻ�dq@J�n(��D@L4���&@M��)PV�@OZ�@|N�@P�I/�y@Q\@�d@R=�UR�N@S%�g�O�@T�?��@U
���
@Vq�V�Z@W�{��i@X�.��@Y+ƥ1U@ZH̺�~#@[o8F-&	@\��;�X@]�uV��@_ 7hMM^@`8�xr
�@`���.�@a�/?)@bUP�c@c��l&@c�H�`�@d�N��dW@e|�7b1G@fWE~D\@g8���L�        ? [��3?b��8�t?����L�?���
�+	?���p��?�&�.�?̷:U���?���S�T?�A=QP?���Ҋ?��T#�j�@.��l�:@�$�:�@���}_>@$w��#�:@-�g3~4_@5�G��@=Y@'|r@D
�"?d�@J��g�̙@Q�����G@W!ZY @]���s�@b���Z L@g�F��-�@m@j.��@q�c���@u�K�q^@zP��!�@w���C�@��z ��@� �<�Z|@���98��@��Y�g��@�PKcy@���G��@��'&���@�⏍јL@�N,0O�@����=�B@��@W�p�@�����"�@�0#y��@��\�ψ@�J��V�@�.tn��@�!��O�@�ň���@������@�\�
���@�Qɕ1��@�c�r���@��"��[3@��K&��@����]X�@��,�"@�M!b-��@ĺ��-@�:@�9Dp@�Ψf$/@�xH1~�@�88v��@��nl4+        ?V�)��?���-Q?����D�?�r�1d =?����R�(?곡��8Q?����Ý&@ S{�f\@�X ��@�K�}lU@ޕ�G�@�E�(@$�Y�:�@+W��;�@1�#93��@7R#O?l@>g���@CNV\-�@H�O���|@O�5��@S�%ֳ� @XPy��P@^��;�@b��|��@f�Vl�@k,:T:@p�\���@s�N�O�@w����B@|��L@��̻cq@�f�0Hb@���+#'�@�1��kA@�1�2��M@�P��{F@��F-�@�q��Y��@�`�U+K@���ɯ/�@�9��x@��Yy�*_@���΋�@��X�_�@�f�:0�@��搟S�@�����B@�/��<U@���E�d�@�K�|��@���,�@�����@���.o@��<5_�@�ٽ;y�@���\�f@���m$�@���7���@�M�=��@İ�-�9�@�&w��@Ǯ�D�#
@�K��        @%N�lsT@`��Q7�@�}�f1@�������@� +j\�@�(�i��Z@�e6p
P3@��>���q@�I	�&%z@���t��}@̨҃��n@֌�ǈ�R@��9�%�@��]ǒZ�@��</&@�[�=]Ѷ@�bF���\@뛆$�׽@�44��@�Rf���@�9��:Z@�:>��^�@�SO���@@��iU/�H@���ڿ��@�66�θ�A Z�!`�kA�YCΨ�Aހ�#�AnK����A��z�AtH�pe#A	Oc)��A
���G�{A��\�i�Aep��bhA+�!!��A0@��&A@�
8�A^]3l��A��Ek}�A��x�8�A5�ywA\t���A�F9U��A4GZ�A��YANx&�|5A�
���A ��t\A!��CX��A"���}?�A#���ɴ�A$�?:�n{A%��2��A&�Q�~��A(:�J�A)5�ϗGA*s�T/{�A+�=��A-����A.x?�٣(A/��"���        ?nI��lo1?�����?ȶ�v��y?���i��?�EO�z��?��?���?��K;6��@Xr��@	�u�:��@>�N��@���Â@�Ĳ�"@�Y��6�@  Q�8@"xjY8@$��3<@'�~ኈ�@*QA��@-5���]�@00`��v@1��9A=@3^�� 0�@5] 6@@6�I�,�@8�~����@:��v��@<����o@>ڮ�Myw@@��u���@A�%�R)J@B��B��@D\�1�@ED����@F�էV,�@G�6�4c@IG���@J���@L-�Ƶ�s@M��_}@ODV�|@PqYD1e<@QG8��+W@R$���c@S�o�@S�9\�d@T��Q=�@U෦d��@V�Wӯ�\@W�A
@Y -���@Zil�3@[?��J��@\k����@]�,gk��@^��V�(@`_cfpD@`��*ƕV@ad�nh�@b�s���@b�)$��@c����	�@dH���@e����J        ?E�$��?��&��(u?�'��-�?�؜$�?ձM�{8t?�J?NJ�7?�f��{?�V�s�'�@^���^@Qt��/@��M��@B2�l%@%!}O��@-ה
��@4��7�M�@<���ց�@CHU�V6~@I��\�*@P�u� 8F@Ul*Z�F|@[n!�6�@`�Ds[*�@d׈��VG@i`��^A�@n�<����@r9`I�0A@u�pE�=y@y7J���@}L���@��ŭhhR@�YU^hm@��ҹ;@����R@���j�w#@�Q &@�mdL��@�M)[
��@�Hӻt�F@�_�Ct��@���1+r�@����`�@�G���x@�d�t8��@���,�@�C�-�@�y�3�X7@�����8�@�u�Qw;@�#��@��du
�@�V��p@�m���@���(��@�����0�@��K���@�� ��k@��e���@��ޙ�*@���@�u@�!����@�N����@����]@��y-�V�        ?4s_�8�X?e�8~��?��]4�ŧ?���ޜ��?��\"��_?�
	���?��4r��?�wۊ�J�?� ���[@�E7 ܇@��Z4{@������@(J�,5�#@2�YOX��@;os��*@C��9uQ@K�V���(@R��>�ٍ@Ym����@`��ӎCo@e��i��%@k�Bc�a@q�1�la@u�cj<1�@{%r�(�<@��lY�fG@�hA�x@�� �/@��y��n@��r��N@��/u.�=@��^�*�@�qN)�X�@�Zi�I�!@�RГmo%@��ߥ>@�;;�g@�=���@��W79@�M�#\ {@�l
���	@�VVM��@�g]@�Y�@��i���@������@��H�9��@�b.�`��@�,��޳{@�³PYV[@�s�dP�>@�A�A�u�@�,�����@�6���@�`<����@Ϊr��m@Ћ&y��w@��Q/5]P@�+�!�@ԕɄ	�@����@�@ס��0@�C�B���@��	IܦX        @!���gm�@_;���9�@}����Y@���>M�@��u��F�@���Yvf@�]�xX@���6��@� IT��@������@��-;?@�ߝ2�rm@����W�@�2�nq@ڪ���#@�W�t2�@�~���Z@�'���~9@�Mіx4@珒|])5@��æɾ@�hE��@� �˰�@��l��@�E���l�@��`�BN�@�K�)�:@��s�{�@��6���@�Q��.��@�"�J�&@���!@��r��!A��q
'A�$���A/p:c�8AU���A�]	�dA��� ��AoGD�zA	f����A
��|�zAB���AǢ�M��A]gs�yA��3$�oA]���AB�T:�UA1�2.oA)�:��lA+·-��A7�/�wRAN&4g(An�z��A��q��rA�H��>AБ� �AfI��GA��zA �]7G�A �]�MA!�����A"h����W        ?v�0��h?�H7�CPa?��O@�:?�j��@2�X@K�@9�W�OY@����s�@!͎���@).ʵ��?@1$c��@6�zѰ��@=��O3�@BC��2׏@F�Ka��@KUJ>!��@PZN�_� @ST��D��@V��_tǼ@Z1D��@^��!H@a&�X!�q@ck�{X-y@e�
A�v�@hrh���1@k4��
��@n �䢹"@p������@r8f�
@s�l���@u���@��@w}���"�@y^�1��n@{M�9;|�@}Jcܶ�@S�	��.@��uh��@��oZ3@���t@���,�<@�3�D�Ǚ@�m/U��?@��}�HU�@���5��@�u5V,@���星@���A[(@�2M��@�{%<�)@�i�>�~@�e;���@�l���B�@����"��@��_���@�ˮ��@�jbm�@�D�y4f�@���$��@��<A�
@�P 6@���i�@���0@����Zo@��\S�        ?q�3�T��?�J.��SO?Ѷ3ed6?�x㲣?��� �@��j߀@:1T&@uC 5�@!+����}@(�G��M@0�;��b@6�C<��@?gp!�.@Ee����@L�tK�@S}e��@ZUQ�ϑ@a6����C@f�ڍ���@mVⴥ�@r��	vh@xq��r@~g�Z=�@�s�j��@��1�}@��~�J��@��E9g�@�9~�t@�]���@��g]Ƌ@�����@��F�W��@�ա}�5@�`z�@�8@v�=r@��1���l@���C@�>$LY�=@��w����@�M�XD��@��Py�%@�bcm��@��I�t�@�D@�K-@ĿN�v@�?u$�@��T��P@�I�W��J@��)�o�@�[��q	�@��cc�=@�pS�C5@�}Y0��@�B߳8t@��YA@�� s�Ž@Ӗ[�wA@�^ŕa��@�(�!=;�@���%S��@��.�-�@הjq�f@�h��#@�        ?�Y,�\`�?���W#?؏����?�i����@ ��8�Ȑ@���gN@���0g�@$��ם;@0��� c[@:�M����@D��G�@Pj��e@YI ��@c�92=	@l?�K0�@@tf�?x�\@|Ů�<�@����8C�@���D�@��0���@��^ŕ!�@����S�@�����Ӣ@���1_@�7�YH�@@�,ZL3@�O#�/��@�E_i��A@�v�`,^o@�߶?_�@�|�62�@��(s�j<@Þ|@	�@ũ����@��9�G?@�湞ex�@�C��ݏ@�?�0��@�8G���@�P�`��@�h?�%��@�~�xH��@Ԕk���@ը�o���@ּݯ��@�Θ��#�@��z>�@���$K�@�eg==@�@[a�@�%*O�-/@�6�����@�J0`$O@�/�	���@�=�*Ea@�J�Z��@��6�7�@�p�7�r@�	r�&��@�_��A�@�H+��7@��Q��Tr@�G�*eA        @P��V�qS@��#��h@�U�/�"�@���v�ux@��漸@�͞3D��@�8@���@�i���0A�8_aS�A#]c͔[A��T2$A-FL��kA-{Nd�Aҿm��VA"�:u�ՄA&����A)�9`LA-��7,A16��A3�F�A6+�-�0A8��r	�A;�58\��A>�|�&B�AA�2�AB��s�<�AD{��E$VAFT�m���AHA�y�UAJ@ �ALQ/sOANsG竘�APSX��݄AQu�{��HAR���\KpAS�i�ÏAUBkV�AVeh�sAW����AY&r�=AZ�;���\A\$��/A]�v���A_oV��~A`�p�&>;Aa�|DF�Ab�y+�K�Ac�"��£Ad�k)n=�Ae�tk=��Ag:���Ah\����Ai���b�Ak��2>Al�^7��2An
89�Ao�Z>�Ap�e��AqqM|���ArNm�*��As2�j��At�+VAu�)�f        ?�E�o��-?ЇF3nYX?��εf��?���@���v{@㈃V@�O&;>h@u��/�@#�cN?�(@(�8��@-���I�@1��uuz�@4by;��.@7b��h�@:��,	l$@=�_��qr@@�W�%c�@B]�5X�B@D-v�Ë�@F	�k�@G��c���@I��KA�@K�I)�V�@M��yn5�@O��ph|�@QK�*K�@RS��UI@S!���@T6W4Z@UM���>'@Vhr�n�@W���n�{@X���u�@Y����@�@Z��]t��@\����o@]Eh�d@^w$V�@_�S�]ΐ@`wT��u@a��4�@a�(��7"@bm- �8@c�m@c��D��@d\:��@e4�[�qi@e� �W�@f�(����@ga�8R.�@h��_C@h�l�*��@i�Հ�X�@j_̔�4@k#Jfc�E@k�N��3@l���T�@mw\��B@n@�:B@o��2g @o�{�Z&@pUJ���@p����        ?7��Au?Dn�q��?pY�jN?���F�@\?���o�9?��8`��?�ҥy$�?��&�B��?��X����@�U��@�ĉ��j@����	@$ B�[%@-4��ّ)@4t�8�G@;�h媝@B�s��@H�^)��@N��0�@S��l;ʇ@X���Ё@^V�ӛЖ@b�kY���@f������@kK<M���@pU�?�c�@sh�=�@v�0�c�@z�\3M'@D���J@��6(@�ֹ�Mr�@�܍�)!@�.����@��n�-"@�c���@��{2��@��ߺ��@�[����@�
���"�@���"�@�|�٩5�@��3���@����=�@��"�P�]@��zi���@��t�s�M@��l�<��@��;d@�0Î�S�@�l�*�@��Q�/��@��T.U@�q�k�Q@��L���@�f´�Gb@��M.���@����o�@�?���@��^���~@�`��o�@�K�Rr:�@�=��f�        >�O�Z�dN?;��e_?c&ՋO6?�s0X�a?��)Cʢ|?������?��V��Pb?�WD����?�R�}	l?������@�пp�@�J�hm�@�P��@(%Ho�Pt@2Q5�̅�@:����@C':��A@J���W$�@R	��!��@W�ֱ�]@_B�izn�@d!�C�@iR町��@o����$�@sg����@w�Vs:��@|eo>B@�꜅j�k@����G0@�e�ix@�0^�nT@�`o\ZG@��#h��@�~[v��@�8����@�,��0@�\�Ȁ�z@�eZ�5==@�<)��)T@�3��^@�M��ɋ@��8:��@��+�Rl@�p%8��w@��_6@�wԹ�@��Ggi�Q@���;�R,@�,y�� �@��\٩�P@��V�9@�� �7�D@���9yǭ@����a�^@��IA�Ze@�j���@�E%C�@ā��'�t@��$����@�"3���r@ȇ���;@����M�@�{)����        @GX�5��@|K!w\�@��)4��S@��s�B��@�"�{��@����@�nLm��n@̆���C@�?u�H��@֤��l@�n{�w3@�K�,���@���g�@@��|9E�|@�ΰ�w�@�\Fx�y@�̥'dY;@����-@�l\l�_@���K�ן@���Bs+@�Ǿ���a@���s@�[`��nfA d=��A��'��2A����VANx퍕gA����A%����OA�H3*V�A
-uR�xVAėDnAiB�Va�A6��$AoKj��3AY2n��AMt�Y�IAN$����A]/�=�A{���߀A��;0�A��Ҩ�A1X��?A�����A�s��AY�]���A�ا��_A +4���YA �>�oW�A!���T��A"���:�A#f�]pA$B����A%#?ޯEnA&� A&�$�FDA'�{wv)=A(�g.a�A)ĐW.�_A*��d�y�A+�g�(��A,��-�        ?+�yG5�.?f�R�:ʤ?�5�Ѵ�?��on21,?��f�k�?�����u:?ŋcnHH?�s)��-?����LH?�4i:�b?���~��?��@Nl?�ϧϷ׮?�2����?��.���?��hח�?��0Q�`�@W����@�L�`@P���<U@���m̤@J�j�@?cY�|�@�-x�^@h����@^�K0F�@��:]��@ ���!��@"}N�,@$�z��U@&�l�t�X@);KA��@+�eld>�@.�D%	@0�2[�C@2[�@�@4ӱ�At@5ϡ^)|:@7�	"�0@9���� n@;�I\l�J@=�!�ir�@@&<0��@A]'�s�@B�@�E�"@C�jf]�@EV�?�Y@F�R��8@HA���t@I�?��N@Ka�e���@M��=@N�V�/�@P7��?;P@Q��U�H@Rswg��@R�RI�o@S�n�_K@T��B���@U� ��@V���0E�@X�:|�@Y�E�Zu        ?���Db?Iň�M?p���F?��?� _>\&?���3�]O?�x��f#x?ҿ��U &?�T��a"V?�(X�#zM?������@
/2؁�@jZ�S�@ ���j�@)����0�@2���*�A@:� �)�	@B�O|���@I;���T+@P�7$d�j@U���*@\o�-�@a�1@�Y�@f/�-��@kY\w�X@p��� @t#@7�@x�EC�S@|�7��Ш@���93�^@��5�'@��*/��@���<��@�zӯ��r@�n�����@����)�@�|��͡e@�_���w"@��q�/`�@��-���@�˰��@���9�	i@����}-@�)�'�!@���/��@�$Ζ!�j@�݋3l�@�_%�^�@��ЩR�@�}��2�@�+8e'@��G.��
@���S��@��PIs�@��i0���@��)f�<@��{z�@�'XaS�@�W��F@Ĕ0ʜ�C@���%�@�2�0W�@Ȕ�        ?�Bo�G�?M������?t�
�S�j?�	��{?�آM?��_?��DuL�?�l�pZV�?阡�A�?����$��@�2���@�����U@�ʷ�<�@$�qΔt@/��`�/�@7]UT�-�@@͗	4@G�Ǜ�D�@P1獻'�@U��l7C�@\�Yj�V
@b���?�@g�i�1��@m����a	@rb&���@vu����@{�p3�B@�2���q@�)j- @�vX�T�@�/��U3@�!],�@�C5T��@��s��@�A�Iu�@�Iǋo:@�����@�Ys�9��@�k��9D�@�I�1�\K@�G?ث�@�e��BV�@��Bm��@�0����@��7���@����V��@���w�@�{��{O�@�	y�2��@��q��U�@�bL��@�.��$1�@�:g��;@�
�U���@����&@�"Д��@�Bҕ���@�pAT�,@Ī���?)@��ϼVs@�H'���@ȫ���@�D�g�I        ?ܯ�D�K�@oU�@@a�@q�@W>�tP�@h�a�V�@u��|R2�@��g Yu@���ǂ�P@��-�6@�T�f� @�!k����@���� p @�^Ê�]@����ϭ@�����=�@��8�4�@���׋@�\�(1@�5)vn�@�%e'JP@�w�
@���?�@���j��}@��#��@΅�.cd�@�+�֔@�C�]>E@Վ����@��,8]@��L�n�@ݶ񽧖�@�rA��.�@�'�/0�@��w��%�@��da9�@��m���@�;�k�d@�Md2�Q@�K��&@��a@W �@�6c�8Z�@�=4}�3@�1y�e@�̛>��'@�| Jv�@�@}'Αz@��M.@�	eW��A L�܆�A���bA-޾-��AR
N�uzA���ڝ�A��RCIA��Π�AV����A	��<���A!v��A����rA�l��nA�M����A�_6��PA�K��        ?�XՇ�L?�muU���?�BV�Xy2?��'����?�m����m@�L%��@���L@��-r}@�G��"@!��b�@%Q�T�D�@)M��}@-;B��@0��c��l@2�A���A@4�p�~:_@7Ms���'@9��,���@<&����
@>������@@��Y�}@A���\�@C][�&iA@D�s��w�@F;	-���@G�/Hbu @I?,�e@J�9�<i@Ll+���@N�O��q@O�!��@P�澼�@Q����@R���p�@S�ܛtX�@T�=H�4@U�P����@V�H��n@W�?�e�@X�>b�@Z8\U�@[R�0�@\��:!K�@]�a���@_(�K3�@`@��r?�@`��b��2@a�����@bb����@c!����@c�E��K@d�O��2�@e�׫J�@fXP^���@g4����@h�!A}@h���e�@i�Ɏ��@j�q��KT@k�
���@l�{�==�@m��3}f�@n��:1        ?UZL�?Xw?�1ʊC��?�D6��w�?��H�J�?��N�B�?�XW^�)?�;l�x��?���u��@F/�
n@|b�̡@F�.X@(05-@2�5��К@;֖K�R@D/F���@Lk�׫�@Su�P��V@Y�J���U@`����x�@e�i�R�@ku���@p����c@tH��k�@xK�0%�5@|����XY@��-���@���ߝJi@�|��V��@��<q�$�@�'<hh@�rS:��!@�u�F_�@����$��@��.��G�@�n�e�/�@�$#(+X@��;���@��L���@��h)�[@�H����@�ߜW�@���K. �@���@�#��ԕ�@�`AC��@�\�?��c@���!��@�����@�>
�΄^@��>�I�@�"��㘟@��;kI��@�H����@���#�@����ݞ0@���9��-@����?�@����}�S@¯]���#@ü�l�2�@��~���r@���~n�@�#���3        ?�ᗊ7�q?�+ˤ�R?ʷb�:]�?�O�ؘ�m?��o}�?�+����@������@�Y>@Z@G�`��@ݻ���@"Ō�T"@(���z�b@0]�t��@5Ir3&�+@;s'��0�@A��E9@FD�:�yi@L�f;�@Qz��,�)@U�\N$I@Z��Ȱ�@`$���V@c}}�4w@gYuEwi@kĶn�^@pe��mc�@s<�r@vm�)A��@y�y�Ú�@}��O��@�.���v�@��@�� @�D�߉�:@�.ǵ�P�@�\`�]{@����ρ6@����F��@�̊��G"@���vuS�@�S��+@����e�@���6\��@�6�ݼL@�����2K@�f�m@��@�'����@�H�� �@���#
�@�C��@�UW�J~@����g��@���P$@�j��=B�@��O$
I@�FÃ{�(@�Ѣ/Ӝ�@�pP���@�#1��k@��@�@�����@���'F@��=��@��+��        @O�,��x@�b�l���@����#�@�\9%L�@�x)^��@����آ@Ψ�����@�A�5���@٥Q\���@�tʿ�/W@��ߨ���@� ���$@�_���@�Ns��@�Թ@��u�y@��Sv2@���?��@�����`@�ZPM2@��ܕ�6`A �m���_AQ�]�?A��;��=A��M36�A<����A	���s�A
�X�nA�嘺�A�qg?��Ar��f�#A�۩ˁ�A�wH�A�ثa�A�
y�.�A8j?wA}	�E�A��E��iA$��OBA�)+V�A��^��Am����A�pH���A �SG�A!��a;,�A"^�c���A#7�EW�A$su��A% �P.��A%��5KBA&� xC�A'�(��~A(�e�vd�A*�`�fA+)e��R(A,O�U΂LA-}�h�<�A.��J��"A/�|N�A0��H�A1?����A1菧� �A2�w�_�H        ?p�����?���7���?�&�F�Y�?�Gޏ��?߂%3�C?����G?���5?����>�`?�L�(a�|@S�d��~@b��\1@
��W�H@��g��@R脁��@�/��z@躊�b�@���7 a@(��ڵ@ �d�:p�@"�����C@$tN�7��@&r�ʬ�@(����T@*��6>��@-��q�"@/����v@17�K�@2e�;BK@3�E$�Њ@5Nӊ�@6�Ԫ��@8�}����@:za����@<�G�n�@>���-�@@x�T��%@A��<��7@B�Kr�J@DK|P\�@E�ӯ�H�@G1��M@H�ɿJ�@Ji[_b�@L&�	[�@M��飛 @O�.�*��@P�Ӈ�g�@R�n���@S6��� �@Tkߛ��@U��g��@W	3�!T@Xr"�ć@Y���@[y�o&6O@]r�P�@^����E@`H2��I@a4�~�:@b+�&���@c,���R@d8���@eOoW�n        ?����T?I����m?q��<��?��7��?�l��Gג?�B���?ǘ�q�n?�~/֎�6?���2�U�?�8J��@D���N�@���E�y@=4�k�@#/�Zծ�@,-$f�k@4����@;�h�<s�@B⑑-�@I�!��@P\V �X@T����@Z���N<f@`�����@dyX�n|@i͠&i�@nG�l��@r,`;��@u��R@y���\@~'��c1@������@�k��sz@��Zخ@�&�D��@��r4�@���)���@�$�.�B@��w��q�@��b+��@��&$�n@�1�!{E�@�%,�@�)pTǭZ@�h_1�e�@��Ԕ��;@�zѭ��@�Ts �@����q�@�\E$�F@�$���fl@�\v3�@��-+j�@�Qo;���@�����t@�1v;}�@��i�`��@�^���@��,��*@ń8�{)@�<�3U��@�m�+ٻ@� ��j@��j�        ?j��b��?�=��Js?�����'�?ʥ�e��#?�V�>��Y?�6ts �?�y�2d�?��n0�@�G�	@ޤ5�<@!9t-�@,��8��<@7qK�(0@B�1��[@L��V�@U��rQ�V@_�5��N@f��@p(���@v���:�@}��8M�@����C~�@����(z�@��^���@���D}�@�;O� a�@�"��f?M@��ϰ̷@�|�$k�Z@�ӶU��@�L`"ECG@�㬒{@�����m�@���6?�@�Ě����@�!c<0@�;Z���$@� ���N@�Է���N@ƶ�6�@ȥn|�!�@ʡ �s�A@̩��ZO@ο���Q^@�q�1�@ыQ �@ҭ�
@�ת�< �@��}^zE@�J��N�+@ה�&��/@��[�F�^@�L�m��@ۼ�b��a@�:��z�@��~���@�1�
o�@���y�@����j@��Ղ|\a@�¥9�@��N@�o0V�        @+΄��@bO���i�@~�{�?:�@��~A�א@���2REO@�<c����@�{ZEjԖ@�.�gݠ@�"����:@��{a@ĭ����@�¢���B@�1��ѳ@���=��g@ӔC��~M@�[��a��@�X�u�(k@܎!��@� 
O�J�@�ً��@�շ�,�@�����9@�>�8%�J@��^@�J&Oȝ�@�ղg�q@��-�a@���$�?@������@�����.�@��0���h@��kd͓@��~����@�`8��Ae�
�AsmP�h�A���]�kA��yo��AKKތ0�A	�G}/kA���ԜA����<A1�i0RwA���$=A�W����A+H����A}3	��VA���%�IAU�C=QAܽ=h�Au\$��AA3dw?	Aٮ9?��A��A ��)~ ^A!��khv�A"��[�w�A#��Q��EA$���aA%��0h~�A&�VЬ�A'�^\<mA)Im�g        ?�T\J
�?��	�r��?ԏ���e?���c��?�\U�`1-@ �ބ���@��̦x@&-�u�@�[K�3@ [¥$@":O���@&^O4_�@+L4n��@05���R@2�%Х�@6g-��@9�"49S~@=<S�.�@@�n���@B��R�@�@E$
��~�@G��Ơ�P@JLX�X�@M �qD@P��,�K@Q���'�H@SUO�;��@U���A@V�&���@X�󀷈@Z����@])�����@_oߔy�L@`�Dn�!�@b)<���-@cx=Q�D�@d֞x��&@fD��Cy�@g��k��@iR	L�ڈ@j�t��@l��pˁ@nr��pvF@p*|(��@q'���Y�@r0��$�@sF���+@tg/���@u�k�A��@v�����@xxE'�@yh�g�?@z�e89!@|8£i=�@}��h�R�@C(n�G@�ot�xj�@�E"�D��@�"�\�I@�	+���@��<�=�@��q׭2u@���Dy;        ?7|T"j�&?r�`W%?�i�Qި?���_�b?Õ`w�jK?�s`]��f?��G8�۽?���w�~:?�<����h@�f(×�@��y���@f�)���@&0G#L^@0尿���@9@�h�%�@BfK�:`�@J:8�a+@RM����@Y
x�	@`�o�h-]@f apO��@l��+���@r9����[@vכ�$�e@|6�u�[�@�03Z끑@��S,'%�@�����x;@��ވ>�@�܂'��@�y�p�@�N~v�K@�]0�u7@��!���@�8� C�@���PF�@��k�|�!@� �Ζ��@�2�re.�@���"[��@��7{@�m��x @�MC5�@�`�ai*I@�����@�=	Eq�@��Xv1�@�I�>�c@��]�	y@���Y�@�59-���@����.@�\u���o@�F�?�~@�7|>��@�.����9@�-y�/|@�3I��@�@�?K�3@�V3,Y �@�t�@ɚ�M-�A@�ʟ���|        ?1W��?mN�"4��?��t~:/?�j��+x?��Ȯ.?�����2?���.�?��<�d��?��[�o	�@�+;��@z����@�%���@%t��93@0�3v?@8�r�d�@BG-~O��@J�@R;YKL��@X�_��6@`���-�"@e���@lW!��Is@r��Vc�@v��6��@{� 7��@��qX@���)X@�y��_��@�����@����M@��N59M�@����J�O@��R�9@�Q�@�Y ��@�Di���@�J'���@�i��j�@��ǏB�@���!Q�@�O4V%,@��`&>A�@�'=�Z� @�t��� �@�ˈBZ:@�+�i�@������@�[����@���x ^�@���Jb@��r���6@�/��#��@�� ��?�@���Y��@��4�ӟ@�g� ,@�p_��fd@�a�lq@�Y��9�3@�XayD�@�^D���@�kf��g@���ҠY        @,�2Ő�t@a�h#AN�@��y����@���8b@�k�hNx@����v+T@�Ho��x@�)��@�����(R@��5�A��@���2��J@��y.�}y@�\�fD@�Q�iM�@��/�^@��D�Y�@�Dm
�8@���/
F�@��^�l��@�)�}F@�oo�?@�']g��@��.#�V@� V�*A &����BA���A͒}��4A�z{%}�A��{ŤA
E`
J�A�g�}�AN����2Ah��A.M7��AֹyЧA�v�|2�Aq'���AJŬ�*A>�b�p�AP�dmA�o8��A �f�b<�A"(�8�BRA#zlh�!A$�N� �A&^����A'���K��A)��ϵ��A+\}����A-4�Y���A/%�j/�A0��@;:�A1���h}=A2�$�z*�A3����TA52^^���A6}!b���A7�J����A9AR��A:��DEA<Fڎ���A=�1"5{A?��        ?i�6˫E?�C�A,�/?�~��?��ŗ��?�oH��?��D8Ѳ@��-/@	��D��@WQ�I@�KK���@eq��zQ@"}P�XI�@&��v�~r@+��X��@0v�`�U@3XzJ~�@6pP�e�@9��_��@=0�Aqk�@@j,f��@BTJ~&��@DXB���@Fv��Q@H��d���@J�ͬ�i@M`�-���@O��u6@Q7�"��V@R��r�B@S�a���@UM�/v@V��}�@X(μ+@Y����@[W#88�@\��yw�@^��'}@_��|��y@`�*� ��@aPq��q�@b4_�^9@b���S@c�~��;K@d�]&ڀ�@epg��X@fU^���@gA���`@h6Jm�@i2Է��@j7�m���@kDZ����@lYXɌ��@mv�g��T@n���ҳ�@o�'�vg@p� �?v@q �$u�@q�F�so@rl>T�$%@s�	[Z@sɞ��@t=<8�@u9�����        >�����(�?9�Abb�O?a�i l?|ʹ���?�yݝ��?�8�n�!?�f����W?��m�Ư?�)@���?�1�<�k?�sF`��@L1��{@��>v@_�mQ-i@&oP�@0��[
@6�����@?fQ���h@E8���E7@L��',@RNEGX�@Wq���$@]�1�N�e@bh�n�k@f���u�+@kz�.a�@p��:@s���Ӗ�@w$�F��@{
���+�@Y�myc@�
�O��@��Y�t�@�p/U�\z@�|j|��@��́M)@��:�X@��̅Ol@���@��=�n�@��٥��@���h�Z�@�4T�G8@���Q�PJ@��پ�n]@��`y�@�?�.l��@��l�Q�@��`{�w@�����:@�����@�D3W�Tp@���=�׏@�(���J@�g/n`�@���i{�@�K
sGr�@��ᮃ
D@��]��b�@�E��dQ�@�`���@��l�@���9'|        ?($Z�@�?_��Ԑ�?�̖*�?��S�?�Z���9�?�����?ȯ #�f<?ח���&�?��(��u?�+[�n@ ��Ȫh@�xEpB�@.�/m��@ �o8��Q@).5r��B@2�5r:�@9T���[@ALct�@G�_ F�@NC�v�78@StPLa��@X�ߜ��@^���t�@b�6~��3@f��4✝@kB�y�
@p&d���0@r��ݓG@v3dW�3@yyZ��c@}6�
v�o@����Q0@��]�@�F:�V�&@���tk@���,�8@����{�@�z����@�8�_:6@�M"�w�@��W�z�@�6LA��@�{Շ4b�@��E5�@�zV�b�Y@�j����@��L4��q@���e�g@���D��_@�v9 ^�2@�J.���@�8����M@�B���@�h�O�@��q!@ˉ@��-���@�H�~眘@���w��@�����@�r(>s(@���H."@���Mt]*@�@�e��        @�ڔ=<@ZhX"	��@z^%J�x@�N�����@���~�@�l$��۽@���)o@��#�,��@������@�M���o@��?��)@�Fl�\�@���芗�@�d��$9H@��$G "@��$|e%@�|ը2�@�T2�^	@�nM�]�@�S^�Jв@�^lñ��@�(5�B@��@�K�@�nO"��s@�L�T@�j+��~�@����kӂ@�Zk���&@����q@���K�M�@�,M��^�@���+�@���<�G�@�ul �e@�T� 2��A �C�L�A���L{gA�ׁ�Q�A�"6�K�A��?r,�A!Jə<Ac��X�A�� ?�xA
0}/�A��[hm�A
rsTupA�xh��A#�nqR�A\}W4�A��w*�A���L)�A����A���6۶A��c�&Au��5A673R��Aj2�Y��A�]]*�_A�UZ�mAI[ݬW�A�El�kA =��MA �Pҙ�        ?���0�(?��nq��?��
#&?��q���@ݝ�_�=@^}�H@X�u�$�@ �mE��@%~��>L@*��#��@0W�3�@3�T�Hi@65�\^�@9�Lk@=
�ͯ9X@@Zt�T1�@BC��N1_@D@��uee@FQ@	U�@HtE#0�@J��\L�@L�J|V̕@OG��=�@Pצ2:XZ@RfM��\@SV�ߍ��@T��x�`@U�sS5�@WM�Qx��@X�&�ʒ�@Z����@[����D@\�p_�@^r�c�[Q@_��5�@`����:g@a�,�1/@bT��@c#L��V�@c��n�	@d�Vr��@e�Y|qY�@f�6_��q@gf0&+@hL�yi@i6:�E @j$�]`��@k���2@l�G@m�R^C�@n�)W=@oL_�@p����Y@p�U�L)@q'�u@q�9�X��@rJ6�>�Y@r�|�{��@sz��ځ@t��rN�@t��س�:@uY�
#�@v J�S        ?#pF4�I�?e?�����?�5S��c?�]�)��?�=����?������?̓��f(�?��е��;?��.)��?�T3V��?��D��ʥ@fܥ�+u@�x��@����@#AdX��@,
��-�@3�L��D�@;�@�X�*@B��� @I;�.@Pu2�@U9Fe�j@Z�:�آ�@`�����@d��Z�7�@i�ɫ�m�@n�Cyp�@r�Ǘ@��@v���C*@y�08x�@~I�^b��@����w:@�7-Ղ�b@�!1��h�@�O_�@��t��?�@��]ٸ@����}_1@��c���"@�D���@���׳�@�mQwt�@�E���@�&=;Y@��$Gz/^@�w��.�@�G��@�3f�]�@�;�ǭ�@�aemn5�@���N��@��5�M�D@���_�#@��fO�@��N3�@�� ��@���g��@�"5�p�@��S&LL@��>�z2@�w^��0G@�4�Ʒ[�@�8�wH�        ?a'��yw?�����$�?�E�Q/?�^Ky7?��8���?�]p�tk?�� ���@���G �@�Y�w@��406�@ �;��@)��EM
�@3"�24@;�'w���@D����@L0�6���@Sm\j��@ZK��{@a}�<�@f�ɗ���@m���b&�@r��e� �@w�X��s
@}Q��7�@��#����@�֦Jai�@�>�m�r@�=�a��
@�m��D��@��8��u@�d���@���έ�@��<�D[@���ƾ�@�5Lc�O@��S���@���C<C@��"X�%@�p�v�B@�$.S��Z@��\�\�:@�Ղh��(@�ӎ�Tm�@��X���@���6�@�a���@�`$P��@��os��@��4��}@�4A�h��@ől:S@���L���@�l��m�i@�����@�s�vq��@���@Χ���aI@�)u���&@�'Z�F�@���Vq@��gO���@Ӿ_js 3@Դ-��d        @R�,?@��O��@���J��@�0�+t|@�r�7.�@�
�h|ї@ρ�嬕�@�I3�B�d@ۖ��Oװ@�Pv��o�@�0IRQ,@�g99a��@��� �@�h~�Զ@� ���[*@��.��H@���w��I@��HM$��A ��\(YA��^�A��u���Ax���;�Ax{Y1A	���@��A���XE�A�.@�A7�U�T�Aw��UAØ��DmA��О�A����$A��y�Y�A�*!�A�Ռ�A�����WApH�\��A7Eղ�A �.ztSFA!~5��1�A"~9���A#�Łw�)A$�e�%RA%��1�A&� D��EA(&��ee@A)n,��A*�"�t{�A,&��}$IA-�A�.��A/ם/6A0W�����A1+��A2�7�A2��dQ�A3�S�)]�A4�c�~NfA5�� ��A7���A8'��<��A9\�T��A:��iP'kA;�99$�iA=^m(L�&        ?��/6�c�?�Ç,2��?�]ۅ�;?����6##?�1�?L�@ >��]�@^���	@�[p�@&�Tn@�|��h@"6Dszv2@%���)�@)���i�"@-���kxp@1\��v@3�rm�!@6#�����@8��3S�7@;�&;�U@?��Ay�@AB���f@CI�撩@D�C�yc@F�3���@IU����@KKc�XE]@M��Zt��@P
q1�V�@QT�-���@R����@T���^�@U�ʸ�@W8x�ȏ@X�j�3�@Z�A�Z�2@\~p�I3R@^mA�k@j@`9jޕx@aG�����@ba)r���@c�+�8I@d�͞Z�M@e�i�^�@g<� ��o@h���@i��i%~@kiv���@l�4�R@n|�*M@p�M�3@p�8�9�/@q�t�4[@r�RHKu�@s���f�l@t�3=�J@u���� R@v�����|@w�]�X@x��>?W�@y�73Jd�@z���Ί @|"�!���@}W'��$�        ?[�����?�6LóXm?��ΰDn�?����u�?�Bp*%��?��K}���?�a�˰��?��/�0�@�rlFIr@Nh��@Ԅo~�"@& ��؆�@0J����@7sÈ��@@r��9�v@F�{x��@N=���E_@S�%��@Y��@`yR�lP@d���*�@i�c�H@o��f%�@ss31x@w�!���G@|9��H@��G���:@��i���@�D:<�s@��V?f�@�_�P�a@�'�9��@���8�/y@�|�ѓ@�����ԗ@��� %!@���L�[�@���1N�@�ظ?�YI@������@�� ��@�!Tt�@���qy��@��u���a@�\��9I@��I��W@����gN�@�z F_o@�]W�2�@�X���>�@�ln�˺@���C=X@��j3(T@��h�@�[�O�-@Ĥ��*�w@��udFt�@�_6ؗ9@��ȷ���@�M���˥@�؊ސ�@�p{���T@�^��R        ?r蛩C�?�9۹��?���8{:?����)��?��-ҕ$?�.��@N�>��@@�W['@�^��G�@!��}��@)/&��4@1�ʼqn@8��"wE@@��RH�@G#9��C�@O,���@@T��練K@[,g�s��@a�a��f@f_���j@l�.��@qmk%��-@uU��j�$@y�<����@~ܭ�s�(@�Bb��D�@�d[:ײ@�Ժ�pd�@���'|��@�P�����@�~�(�$@��G���@�Q�d��h@��;���4@�Ǯ� 7|@����@�r��S3�@��g�/�@��Z�qB�@��P���T@����(��@��#wVb@��h,~cs@��R�E@���8�@�� �@�<�O�,@���u^��@���Z�@����ǵU@�(}�]'@��t`�L�@��q:�+@�h�1z.�@�)�(6|s@�*��E�@�5�A�@�L��D�@�o�;qQ`@Ş�����@���I��X@�!�k�E�@�w 2a�        @M~4��@���,�o�@�]���E@�
!�Q�q@�Ѫr+��@ƫi�u@ϫ��4!@���"f`�@ڮ��'��@��>6�@�4/^�|@�ʃ�}$@�m�L��@���]@�FE���@�-�"�Fs@�Z��{#k@����Kn�A J^�;�=AU]E%��A���1JzA��AAaA	�c\m#�AS!Z�fXAX��R=AN���Y�A�9�lA���p�A��%1 A]�p�B9Aٙ��
A���AcA ��01�A"]����A$���A&|0L�IA(<�jaA*R�U7�A,��P�.�A/V�&E~A1ym`q
A2�rh&TA4,n[e��A5�v�N(xA7�|0^̩A9�?��1pA;�;�
�EA=�7�ƕA@-S���AAO����AB���>&AC���AEF�&Ѡ�AF��{��AH01&)�AI���B(BAKM����AL�
��$�AN����d�AP-Rp�]�AQ���wAQ��ѷ�AR�/5r��        ?�������?�$/�=d�?�bѷH�?�k�<��?��v�2�@��}�M@	qb���5@/��L1
@Az[�~@���!A!@!J�
�@$t��w�@(��n�@,�m��V@0 ��e�@2]�s�c@4�$�N�@7:��k@9�p�*��@<���5@?�	��T@AI��':@B�	�@D�.�v��@FT�Y��@H+n��=�@J(�$�@L����l@N��̤Z@PO$��@Q/�����@RHd���C@Sf�W��3@T���9r@U�h�m4]@V��c
@X��@��@YJ�Һ�@Z�!�´@[��ݘ�@]a��LY@^S�|���@_�y�%r@`tW��@ap�F:�@a��j���@bgJ���@c�qeŖ@c��@���@dY�Bn�@d��bet�@e��0SF�@fI�]�@f�eg$a	@g�QhA��@h5��k�<@h����@iyn\�_1@j��a�0@j�����@kX\��.�@k�gC��@l����        ?q�.[h?�Yo�S{?��xql޳?�P=�P�w?���U?�u��]@w1�s��@	��@Jl`��@@Z�ʄok@�� �@$d��G�{@*��;�;@1sy�@5���z}@;��^z@Ag./�@E�KZ�@J�u�~G@P��s67@T2,(��@X�e�}(�@]��e�v@a�9�vZF@e��"�@iT'iy@m~�fH@Y@qP��=�@t=�b�9$@w���>@{S���@�]���@�*�j��(@��淋@��/���G@��/��@��h��@@�^�{R[@��͏C�\@���9��@���/6@�\�;S�R@�e|."@��9�
@���!���@�r0�
W�@�pVg�L@��E��@���Eȴ'@�1�iA�@���4jf�@�.�l\>@��
A8�:@�s�P��@���t�7�@�6��O�@���D1�\@���9pw�@��WMj`h@�rC�`�@�9�쾒'@�Evگ�@�Z����        ?M���j��?~I����?��V��?��� ��?�锊��?͵8���?��(p/V�?���f�?���g��c@
�5|���@^�ԯ�@#\n�K�@.�+K
�@7}����@@�zo@G�a��@P^�]�I�@U������@\�}Mʠ�@b��K.�@g�B*��@mdQ�i@r0���@u��F)S@zi���h@m�I�8�@���;��]@���ߩ@@�*��@���9�@��ٙ�٭@��(�@���'��@�M�l9�@�R�!'@����_ŀ@�����@��f�i+I@�\���@�5�<�u�@��Z9�y�@�U�rQ@����F�p@�̟K�&�@�O���Z#@��� ��@��'����@�hf��@�L�v�@�K{��R�@�d�t��2@��!��]n@���n���@�+i)���@�p��Vv@��#u�;@�)�I�@ǜ��_�@� ��x2@ʵ/�бk@�Z�ۂ�c@�G�d@��b�o�5        @>�L4؃�@p�KX ��@�<�%�ɚ@�#my�g@���;��J@��˂_�@��>�Y|@@�ȕ�IJ!@�a(G0�F@�WjH��@�S��,S�@ڢ�g|p@�>5U9�@���t@�/�D�i@�d���c@�A��ǋ@�Aw�~u�@�2��V�@���[)�^@�o��@�Z�0�w@�?X���@�=�A�@�W'MT*h@�����E@��Gu4~A%�n�Y�Ai����6A���R�A�3��A�u�a�A�E�&/A	��္A� K�A��xWa�Ahc���UA(�',A�"�a2A��	���A�o�$~A�'�P4A���9��A��6V�A�.�u�A�Qz3��A�T�3A�)i6JA8dP�5�AWP��#DAy~dA�B=�fA�Z�v�A u�,�`�A!	�+<PvA!��ͲA"4f��A"�^\�x�A#`ܩ�A#��x��A$��s�I�A%'�4�[A%�Y1��        ?vV//�n?��jv��3?����hu?�hdo���?�5w4S?��-Ņ"m@~���@
}��D�@�%��V @}R{��z@����}4@ �-d��K@$;;s�3@'���(b�@+z��M�@/w�����@1�oܱ@4)��a�@6r6kHy@8��Hg�@;������@>E⎄�@@�|*��@B����@C��H-u@EBꠓYu@F������@H�&5/�@J��z+�>@L��3~�@N��屠�@Pj2.(Z@Q�!o&[@Rˢ�ڃP@TGKC�@Uu^���@V�E��)@Xi��k�i@Y����@[���\�@]c��@�n@_0�čt�@`��S�5@aZ.��@bl��o@c��>Y�@d����}<@e���%@f��2�@g�
 50�@i�P��@jI�E�@k�x��� @l��ߥ��@n�����@oS삣��@pSDc��@p��E��M@q�DQm=@ra��&1@sa��d@s���q�@t���h!�        ?}��j�?ŵ��h��?���ˬc�@[u|�N@R+^+�@%�)�Ǖ@0��~�F�@7�ݦems@?�-L9�"@D_���@Il����H@O/��8�@R�c&K�@V�vG��@[l*� ,@`pX��N(@c�{O��@g�
��@k���GG�@p�a�?�@s��ʆ�@w�Y��@z�xvkc@A��&�k@��eS��@���Z�M@���C�j@��]h<&@���2�H�@����;@����@���<>E�@���6�@�7�ll�s@���x���@�:���@�yiۅ��@�阿jW@�n���ug@�	�j�@���C�<a@��#��x%@�i���V@�g��L�d@��Ma@�[P4��q@��Vx2&�@��@+,�@��( ��@�X�;���@���U:�@�47@"t@���G��6@�O=͡(@��i��VJ@��вye�@�7�~�,
@�"zW��
@����@�x]q�@�K��vD@�"����
@�9�fYN        ?(0k���<?b�U��{q?���λa
?���{I��?��~<��m?��C�R��?�1D�?�h?�߉ާq?��P7�~@F�v{@�g��0�@!`����-@,�/�g�@5���]��@@)�.Vvc@G>�����@P-3VhG@U�D�j@\�S�Ϲ@b]�m+�@gS{�f@lC��,�@q��K�@tVe�@w�렊�#@{�����@�"'�Z��@��C1��3@�7����@�/�s0@�|�R�A@�)z4���@��lU:�@��q��T�@�_M���@��!#z�@����z@�[<�a#	@�qO��@�X�;���@�d�G��~@���Gj��@��Al8u�@�i���L@��d�Rv@�����_�@�e���Y�@��u��@��4x�C�@�M�̪�@�G���@��CG�@���-�9@�ԛ�� @��ò�>�@��cf���@�橜B��@� ��R�@�h�W��@ƾO�:Z�@�"&�N�@ɔ��2�@�=��,�        @8������@u�����:@�A`_1�5@��^g��@Ð�D&�@���)x<@�b�b�c�@�ѳ���c@�Y2��[�@�_il:�@�|�;��@���t�t@��B ��A�NK�&�Ax%D��A���A
���Q�A��bA�cY��TA�s��A}�Db]�Al5x�4�AgiБ@An\BO��A��W��A�=�:�A eT�afA!�?�Ʀ�A"�$S� }A#��E`^�A%	`� A&M��S^A'�͍!F~A(�u3�A*Xk�'�A+�AKuXA-E�_
d�A.���\s�A00{�a2�A0�>��q�A1�.��aA2�M �[A3��ZG�A4mk�A5US��OCA6B�
���A76F(�A8.v9��A9,?u�K�A:/9��iA;70X�jA<C���A=U �8<A>j�t8B�A?�F���kA@P�IQA@Ὢ�SAAt��w�AB	_� 9�AB�p���AC9�N�}AC���ADu4�j�        ?F7�g��?�m��j#?�S��pi?����A?�{N�??�����?����)3??��G�"v?��mO� @��`uy@
� �@����]@ b�@eK@y�icױ@m����@!�AH��@$�(	�?@($,-��@+���t$�@/s?����@1�t�Q<�@3�����L@6X�Ġ�@8�We���@;�PO�@>hkε��@@�����@BNZ��NO@C�A�kr@E�)�3�#@G�k���@I�ȶ�.@K�aa�v@M�`XA-@Pp$�.�@Q1�Iƛ�@Ro�"�i@S�މ��@U�k-��@V�#�-��@W��]�QP@Y��|K��@["֌5@\ʼ��2'@^�� 47W@`%*�l��@a�����@b'��@b�e���@d��NX�@eIw�%@f"RV}G5@g?.� �@he<��q~@i�ѩ���@j�7Y	Mc@l�n�p@m_'��g@n���O@p��F�?@p�	�ފ}@q�!$�כ@rE����        ?6��u�J�?���~��?��� �h0?��B�(O?�S=-�-#?�g�.�,b?�l�S0?���� @b}�݇@�9?��@"y<�*G�@-�v��@6?&�Gr�@@�b��@G��VZ�@P��F��@W-�N��p@_$j�e!@dzi?�3�@jgO*�@p��Ñ��@t�$��6@ywR��G�@~��O�e@�L���@���B�y`@��K��+@��R�P��@�s�˹"@��KY���@����!B@�kpc��v@��n@���fg�2@��wM�[@�U(K��@��VL=6@���o@�HM�#�@�,2<�@��N��@��s;��@���u:@��wE@���qD@�C�-`�@�s=@Qq@��n�t@��)�l@�E���\/@���=V@��U>�@����%�#@�1PǰI@������@�/B"
@�z�#�@���nK�n@��N͚h!@���Q@���hy��@�긙�a@�0��|J        ?���UfH?D�n�M��?k���1?��s1�?��|��	?��/�z
6?��=ck�(?�C�Ě]?������?�� � ��@����@H���L�@�i���@%Z��b@0`D�p'�@8VلM�5@A����@H�*b��/@Q��K@V�
����@^9�}	�@c�C .4G@i�x�@osC�:@s�ԃ��@w���e��@|�Iu��@�\�J	/@��a��[�@�I(O]@�` �C@�u}@���k�@��Ǵ�^@������@���q@�������@��J�TD@��^��
f@�#�H�9@�q�a�d@� \4\a@��H>���@�NmZku�@���U!�@�rΑ�h@@�%�}��j@��h	:@��B6Ak�@����<v@�̞�&Q@�� ��21@�����|b@����. @��`�@�$dFi�@�jGֿ��@ƻ!@�*�@����.@�|i��@�@�쳁=L�@�gSi�
 @��8��i        @�5)��@GC�D:}7@m��O�~@���N�U@�67 �J�@���Q�p@���u�@���MM�@�]�nZ@�I���@�1���K@�����@׊i6S�p@ܐ�'��k@���hx�@�)��-u.@獒��v�@�Cx���o@�OxC�-�@���y2ab@�=w�aJ@���a�@����Ю�@�����)}@�íp{A�g�l�TAgۂ|6�AW%�$�AeDC�%[A	�<M�;HA�¨��AS\5� As����A��r�qKA?���A�҅Vc�AX���>�Ai���Aş��K�A��n)�=A�Y�2A�Kڧ0A փ��֦A!��*
a�A#$!hZA$I�cT)�A%��X�kA&��%�A(.:ď�A)��^�bA+�"K�5A,�J�ȣA.L�D!:A/�U%0�A0���8x�A1����*{A2}�=.�A3nj���A4g��<8�A5j~>�{7A6v��Q\�A7�:[uA8��ne��        ?����H?�m-����?��ڍn?𩄑��2?�y�2��@	��g��@E4d�E@ ����@"	��P_@'=�x@-5�);�@1���1�@5dk��!�@9M�9y�@=���~@A%��5�@C��ǉ�@F:�����@I Jn@L?��	X\@O����<�@Q�Ǜ�LB@S�4)Bn@U�[�u$!@W�a��=@Z5�H#@\v�Ct��@_ ���S�@`ԣ'�8�@b7�T?C@c��Qy�-@e'�8���@f���=�:@hO>1�@i�	�?ia@k�
5�@mm�@�Y@@o<�2g@p�TA�@q��ʊ2@rz7�@sz����@t��kk@u�Bݲ�Y@v�`�W�@w�K�\�@x�0o�@z	5�cq�@{9xӮ��@|q�6��@}�x�(@~�l|�'�@�"- ��@����1O@�{��8��@�.P��@��o3=�@���}B@�\�Ns�@�+Y��@��[����@���x��@�}��˶7        ?a�r.0?�}���{�?��\Db?�6d� ?�aYnw�?�(�W�K?�T�����?�j�S�P@e����@Z}���@j|m��|@%��`^��@0��_LS�@9�N`�+@Cg�r�R@L�`Lg�@T���r�@]$NF�!@d68 ʅi@k���"�_@rv��z@x`pc�,�@��ϔ�@�a;��K�@��4�t��@�6>��v�@�`�ÿ@�����Q@���-Q�E@�!��z@�����n_@�ww���)@���A`�@�`�ϸ�@�Ɍ^�@�����ZS@�,�b �@��*$T��@��v��@J6�I@Ĥ4���@��C�ZR�@�q?�jz@�x���5@����@�B6`{�@і6L|@����@�\�|G�@��Y�/�@�HGp��b@��1T�2�@�S�'�c�@��S�n�@�{V����@����@�^��IL@�3��BU,@����aC@��Y�1��@��j»#@�Dtq�R@�&�yr`        ?q�^/;�?�=V#�;�?�zm,<��?�H7�pzR?�aԢ4�?����R?�<�H
F�?�;�"��@.Wo+@�A��$@��l��@���9�\@%Mf)=`�@.H,�zw@5at��v�@=�P�x9[@D�,��U�@L3>���@R�Q��\@Y,����@`xaKf6�@eBJ0�3�@kT,`@q	���(�@u0r�v<@z.y'�@��	�,�@�5�H-G@����
�{@��+��@���R{�@��Zl�hc@���;n�@��?�	@�@�U8�~@�{]�x@�;�YԿ�@�� z	!k@� j�±�@�����@��(�4�@��	.E��@�ee�Ma@�6�.�a@��_�$+F@��)�a�j@����@�.��/�@�Ii!��@��K���;@�
ԸO�@�Q��@å�Z�:@��� ��@�t��<+�@��5\��'@�y�Ho@���}I~@̴gDs�@�gx���}@��$��@��G����@���_3R        @HR�,a^y@}3b��^L@��mq��B@���6�@��!\U�@� Z��@�D4�|m@�,�v��N@ݹ K��@�m���b@�As!���@�T�
,��@�\��Ɯ@�J����@����@�n����@�Z���@����V^�@��7K9T�A ��K��AoC�L�OA!��tA�=�aWfA��I��/A	�8����A��'i.pA!��EA1��J�Ac�T�.6A��C��MA���A>J_�wA�ؐ'I�A E�MAm^�%c�A�P2:�A^�yֶA��ݗkqAk��?�iA ~�x
��A!Jp��k�A"�����A"쒃�C�A#���%�_A$���HW+A%zX�/A&[�ɦ�A'A�pxRA(+����:A)�l,�A*я�sA+.-��NA,3t�W�A-'�<B�A.P��/A/(�a��BA0 �p��(A0�,{7a�A1CD�mpqA1��fޢ�A2tK:�<UA3W1s��A3�%�&?�        ?{Zջ��?�%��) ?�\�����?�dP�?�l����@�{�@丫$�p@�.���@-H>�U�@ ��C�h�@$��x�S�@)[��e@@-�t@1���;Ѻ@4���)c�@7��A@;G[�ӈR@?l	��s@A��c���@C�u����@Fb��U0I@IϢ���@K�S�ֺ�@N�n��@Q�\�&B@R���8�@T��n[8�@V|��@X~�Pǂ@Z��� ��@\ՠ��%�@_)���V@`���j��@b��WF@ce�0�ŧ@dƢoe,�@f4�)pY�@g�wb�	@i9@��@j�P����@lr�s]!@n$s����@o����@p�O���T@qʳ	���@r���w�@s���|�@tӋ�2��@u�Lv�@wVþE�@x6�o�@yl����F@z�6l�҄@{�`?���@}NL��ݠ@~�<���@�9�޾N@��C�~��@���-A@�N/%�8v@�6K@��Y6o�@���Z$        ?�+� ��?�%�*ޑ?裿qxmu?�o�� L @
��#E@�K�v�@���0@"�^��s�@'���{�@,�s�{-@1kn��K�@4���N�@8�x�}��@=&B��@AR+Mf�@D�1 ��k@H�xN�ce@Mǲ�߸i@Q�m�UW@U��@��@Z<;v�!�@_�ޫ�z@cw+�@f�w!���@k�v9\�z@pved5�@s���@w7q�KJ�@{eu2v8@����@��ނ���@��s_HH�@�i�H��@�U-x�5�@������@�J#��bT@���؃3@���`ߺB@�3�4�q�@����ߞ�@��&���@�� V�@�-}��~�@���	�8@�>�}�%!@��{�i@��HK��@� l�#A@���*���@����.3c@��.1ز�@��9;�a�@��ʿ���@��˷@$P@�����+@�>�^$7<@�}̴ǐ@��cI�B@�!�ߩ��@Ƈx�\g@��t,��@�yi�z�p@�JP�i!        ?D��R$�?~�Ve�}?�>���?����`�?�:����?ʜϼh��?�ñ��
	?��wH*i?�6ZvK�K?��wR�@�j�t^@�ڜ^B@��D�@t<��M@&�Z��+�@0T��O�@6�(}�@?&�aR
@D�z���@K�]�7f�@Q�;
�x@V�6���@\�l����@a�Oc�xz@f*��j@k&x��@pNX%8@s�#T�d�@w'�L��@{H_"���@����S@���.��S@�{�u��@������@�O8�g�<@�"���=@�QXCK@�@��0qb��@�T��!,�@�03�1g@�L��-@�U��3� @�)w�	**@�"�=%�M@�D��H&@��f�>��@�2�N@�����n@�C�T��@��4���@�j�ӳ��@�)'�,C@����@��xkJ@��ܷ�O@�^#4(/@���!{�@�#��F0@�z<�z�@��p^&<@�`Ҵ�1@���WI��@ȗ\�|        @>�� 4�@xNٹ@�=7Zȑ�@����9��@�{bw��-@ƫ'�o(S@�dm3՝I@�<S�ݪ@��`�xD�@�%6�7@��{v�+@�x�5D�@�9e�k@�.UQ��@���*$��@��p��v@�,��t�@�� /@A9���`_AB��B\�Aq�Z���A�r;r6A
C�X5ۈA�]{,A�LG1�AQq	mpA�6�}<eAp=��A5��+�A���%A�P�3�A�';�A��@���A ���ӲA!!�(���A"Gs��!A#w.;^BA$����A%��0��wA'@��q�A(�?���A)���A+b��UA,��C=A.W`�7�A/���;�OA0�|���A1���OA2iue�0A3I�3z�#A41�{��A5 � 62�A6m�H��A7�e>��A8{�ȥWA9+2a�>]A:B<1���A;a���sA<��&d�iA=�p�	�A>��@�A@�KzA@��؄�        ?�&�6�W9?���u ��?�*aT�,@�Z�I��@�g
��@ ��8��@'����߻@0��O�@6-��@<��
�o@B ע�zn@FhΦ�w�@K8���~@PJ�ĝAN@SAk�xi@V�C��@Z
��s�@]�LDL �@`�h��$�@c.�x��M@e�E�؛7@h�?�>I@j�$'�_^@m왾�M@pA�(K@q�c�@s��.��I@ui�7UK@w^����*@yu����@{��#i\@~��+�S@�I�;Wm@������@��S�>�@������@����B@���eq�@�y���BJ@�Q�c{6@�D��%�@�SA���@����1#@��)��@����o�@�V���+\@������@���J@�~���T�@��L�@��S��~@�>}�!�@��q�?��@�^����@�K<�ס@�@�+�@�=����@�C�u��
@�Sg؅�@�k#XC�K@��]�D�-@����RC@�����܏        ?x>Q@�c?��p{��?��v<�?�l&�K�k?��k�O�??��)8�@ �\���@̕���@��g��\@!�RF��@*��F@4���C�.@?194+(2@G����@P½�Y�@W�3��1@`��e"@f�ߖǽ�@nQ�Kt^@s�l}��a@y��:�<@����/w�@��p�sO@@�*J!��@�![�fY@��t�6j@��.��Tz@�t�,��@�ⓝ��@��L\/��@�:�	��@���+�G@�;���:@��!�߱v@�B7#�x>@���S�K�@�ߝ���2@��$��@�=���U@�
��@�~Jmx@�Gu�X�m@ȝc��@�}�k�@�����U�@�Y�v���@��H�!�@Ӌ���X"@�N:܊�k@�-�$+(&@�*��P@�E��ia�@�~�XK%�@��9X��@�%��@�p��@��>G�A�@�0�k��@�s��[@�)�s�@��U˼�@�R�-��O@��-:@��        ?nu1qx�?�v�{�?�K�� ��?�fd��&U?�p��?�9 �ɠ�@J����>@��*@-O*�	j�@;�<�@�@I/Ȃ���@U�b��@bZo��f@m|��y@vҋ�4c@����^@��)����@�j���[�@��w|;@���]|�@��N]��@����m�M@��"��@��b���@�Z||�H@�g<ؑ��@��U  �6@��RZ�H@�Sq�M)�@��,��q@ϝE�d��@�˔�l{@��/���@�R��@�^ |;iB@ڿg�Ɔ:@�7৹��@��꫓��@�6�5�J@⓱��_�@��>��@�o����<@��2 ��@�w��\@�����@�̊���@�X���o�@���Gp
@�j.�^,�@�R&��@�@���@@�3�o�W@�-z狂�@�,\��W�@�02��@�8zX`�@�D� 0�U@�S�Ǡ�@@�ePȠ	U@�x<����@������*@����Z@��OYk�i        @p��.r@���1@�D�/��@҅l��@�[�@W�@�Z�-
(@�7��7��@��{��{ A$W���A
<oJ��A�xM�RgA����B�A>И�g�Am�A��A""A�5A%f�:�A�A)1&ܮA-	E���MA0���P�A3+��QA5���Ho�A8|L��A;��R$��A>�P�U��AA).Hh�vAC�y�oAE'"P<�AGg�6 tAI����&AL�KҶ��AOn���|�AQL��'8AS��(oAT��|�AVؙ
(�AX���� aA[=���`A]��K��A`w��:�Aar�n�HAb�pZ�:�Ad\����Ae����.�Ag��C�vAiE�A�wAk]Oh�Al�H��D-An�oaS�Apo0��\8Aq|A�2=_Ar�N�GAs��??��At�ۮ��Av�+Aw_3.�zIAx�p�ykmAz�E4��A{l!���mA|�=���A~Z��8Q�A��C��oA��#���"A����X�        ?R.�1�p^?��1�6t�?���f�c(?�2툷c�?� ~1>�?�D�#n�?�����?�JL ��K?��!���@;�C���@b���S?@	뷈~�@�)�F-_@Ol�@ގ���@ޒ�`N�@���^@l@~bO�@ �L��E]@"�GC�;@@$���+�@&�K�P@)�j�W�@+D泏�@-�a/��'@0�8�@1F�wI�@2������@3��rP�@5^;��E@6֧���@@8]s���
@9��xUk@;�4��_�@=JL���\@?%�I@@nS����@A]اZȾ@BT��g@CRE9?Q�@DV�Q#��@Ebh��{@Ft�>�r�@G��\,p�@H��--�@I�`!�C�@K}NG��@L8?]��@Mv 8�ý@N��#\�@P��@P��\�m@Qc�>��c@R��n�@R�5��@S��&%�@TY����@U#-���@U�h�ej @VěQ]�@W�Ϊ&E�@Xz(�)�@Y\��*f        ?}B���t?X�v7�Io?|���{(?�na�tN�?�W��W?��L�BM?�eaְ�?߉[zb�?�?���aY?����h5@�I�L�@\�h6��@&ak#��@2@}�G��@<��˟�@E�>Td�@P/�-.�&@WT��=@`j׬Z�'@f�~)��=@n����t}@t4��i�@zR���)�@���:�@�Y�^��z@�����?�@�o��~i�@����:g@�5DO���@��'"��D@�)�e�O@�.�["��@��i�n��@�M0�h^�@�pAH��-@��Wt�8@�{���.-@�3Zl�B�@�'�H��@�[�bT8@�i1m��@�G�-��@�IR����@�qXn��J@�����W@�8���ځ@��	�T�@�T����@��J/*8�@�gi���@��
�0�@���g/@ػ/'[ �@ڶ
jզ@��h��@��v�re@��n`z�@��J�2��@�&H5���@�}X��@������@�]�Rx�@�����        ?jՈ:�?�-��P%~?�G'p�K�?�3ؽ�V�?��4O�f?�x��)�@�7�@�vp�`�@?��ZW@W��m�@$���u@+#iB&k�@1��e�@6�D|U�A@=D���A@B��qՊG@GƸ�/id@M��>B[@R�����@W1;&�P@\on�6^�@aDd�)K)@d��r\�@h��R;8<@m]e]���@qB���Z@t(/F�_I@weFz�0�@z�Ϧ��;@~�X|k�)@��v�5��@�z��7@����r��@����[�'@���>�k�@��pZ�@��{,8T�@����^vX@��c��(�@��w�4�@��Pr��@�I0uQ��@���ɤ�#@��i>���@��I1m��@�C��@�����3@��ƍ@��s٭��@�oc �G@���KP�@�;y��g@�ގZ��@����y�@���4UZ�@��29E��@�i�D�^@�ULB�l@�F2���@�<VL��@�7��yE@�8]�Qv�@�>Qz�xg        @�
�C�@S2BO�2@v�1i�i@�.ke:l@��2#D܂@�6�42�@�����) @������0@<�t�@ǐ����@�M�M�@�y�P:ɗ@ԛ=Mį@���u��@�_�l9@����@�d��1@�]!U���@�k����@��M`@��wA��@�#�rf}@��H*+@��r��@��(����@����@�}���_@@���R*HS@�_4r��b@��Ӛ��@�n���V�@�,n�@���9�r4@�_�9C��A �.B�1At�
���A`�����AR���AK�x�c�AK8t�WAP��,�A\Ѭ�2�An����A	����JA
�6װ�A���+�EA�b�Y�A!���#AXF~�x�AJ�ks��A�i���A�b�F��A9z1��lA�[��A���<ACP�8��A����A��ЏƓAep[@A ���w�A��f��A��ց]7A_��'H>        ?�Ȓ��5?��\An��?��B>L?�y=���@*��	@��!��@��@V^�n�p@"���x�@'gl�i��@,�թK�:@1�}�1@4+�5ų@7�d��oY@;'G�.{�@?vf4J@A��l�6�@C�G�D@F{[��,�@I0ԣ���@Lu��T@OJ���f�@QZ��ݸR@S1�u�B�@U+�	�@WH���@Y��B��@[��@BD:@^�87@`�S��@bZs�j�@c�?ƍy�@e3�p�N@fߢ�r��@h��@jn�[��@lN����@n?�)K j@p�~��y@q&�V@r4O���@sH5�
�%@tb�hdG@u��g�?�@v���O/@wё���@y{w"@z6���T�@{qY���{@|�~��0@}�I��@B����@�J/c>�@���7�2�@���|�@�Vi�_8G@�
�^��@��Y{i�@�|d�.K@�9":EL@���=\�@��/�@��@������        ?`�;?���u�D?�^�
&ep?�Vg��S?��<,g�?�]�K@ .8h�ʧ@	|;���@�"�<|@�\X@%G1H5��@/x�L5X�@6�U󪖆@@��Q��p@GF�фz@P����@Uұ��@�@]BO��@b�Mo�H]@h3Y�Fg�@nq�^�@r�W���7@v�-�u@{�Ũc#�@�fo�{�@�A����l@�cy#�ɹ@��[��@�z��"�@������@����pN@��~��F@���*�_@�JZXH@�ȶId��@��T߂�6@�O�>�K@��9����@��U��ͅ@�;��o'�@��ju�@�ܱ��a@���L]@��{>{�@��
��"�@���X`��@����_@���fzJ@�=�n,��@�g�'<@���K@�բ7�M�@�ժK��@�j%��~@��o�$@�)6��i@��d���@�
ɝ�~~@���}�;L@��Eh�@�i99@�A6�}@���p��        ?eł�܌?�ER�B~?��x�Vy ?և��os?�%|~3a?�~�Y�;@ ì�dKq@
l�~�Ѣ@�WZ�1X@�=�T�@(v��Ɣ�@2�V�-b�@<7I\�'@D�y%���@Nq]�vr�@U��'���@^,��	N@d�̄�@kly���@q�S�\�T@w�6���@}���|I@������ @� �Q�@���dS��@��w D8@������@��dѪ.C@�?����@���DP_@��}kO�@��b�Lʱ@�TY�Cs�@�A]�f@���p�@��q �?@��!�@��'l�@�|]ɤ�@��&��@�ٝ�>��@�F(g�3@��QkW@�S��D��@��4�"B@�i�~@��
�h@��pd�@��yF@���Y��@�$��p�c@�{��	�@����c@�M�D23@ӱ��H��@�*�x��@ָ ���@�Z�C<�@������@���\�-@�čhE��@߿
�� �@��0�xQ�        @b�S��@��m_s.�@���+��@�M5����@ó��kLn@��Re�4@�%I�E�K@�f�+D�@��D�H@��TX��@�E kd��@�7��@����Ц@�2��S�U@��?�N�A �N჎�A�S��ۣA_��)_A��,(+MA
���1�AЬ�HMmA��#��A=6��A$�B.Acv\z2A%51�(&Ad�I�A�Q#!�AZ$�	�CA!
�B��<A"~�͆�eA$
Œ�r�A%�inРA'n4T�A)H/X�݃A+>��.A-Pz�uA/~~	�"�A0��|4TA2�����A3X��qeqA4���RA6Թ�B1A7o�>A8�J7�A:qet玃A<��}j�A=���HYA?gP����A@�/׻ԀAA���AB}�����ACoA�6AD��Y�#AE�ɠb[AAF�̇�.AG�5A�AI/ E�AJt� )�AK�S��AM�{�AN����(AO�V*>'�        ?I�7p���?�\�%=�m?�PM��c?�Ʊf�X?�'�éՏ?ۇ�:��U?��r���X?�����?��DޒGQ?�����Y@ N�Rw�@"땈@Opϥ%[@���� �@�5~@��I@�Q�Gh@V��Ң�@���:��@ � �x��@#&僎�I@%���E#�@(�,��A@*�(5�A�@-ԏ���@0�Zդyp@2Hw�ȩ�@4(�cYL@6*�ㅇ�@8O�%bo�@:�T?B�\@=қ�:@?�޾Z�E@A&
%H��@B�bM�@DO�n@E�+��\�@GS ]%�2@I++0�3@J���"�@LȑKx�@N����@Pi��K�@Q{Ё���@R�vǖ@S�x��O@T�}.��@V!*?�@W`(��]0@X�'�A��@Y��	?�@[LEz�E�@\�7C�L@^�>�@|@_}	s��7@`y^��@a7��]j�@a�9oo�h@b���@c�86n(@d[�y���@e0R0L@f	���_        ?���%>f?Fn^S��?s��fl<?��aͮ�V?���I�?�/�i>9?ٟ> +��?���va?��x�v0@�޲���@iJ�"@=DM@�@(\ђʿ@1�LsT6@9�$�}'�@BBX&�s@H���8�@P�D�f��@U�q�{\@\=ѐ+~�@a�A �4�@f������@k�Y�@p����j0@ta� HS@x9��Y��@|x懄�@���5�n�@�� ��Y@���V"��@�����s�@���ǁV@�>�z,�@�o~����@�b���@�y݄~m@��=Ӝ6?@�&�q7Θ@���D�7B@���?}=�@�MT��Q@���XyY@���)`�z@��t Ȍ@��#����@���&{ZG@��&��i@������@�%�]�'�@��`�>�@�e ���@���A��@�o��+��@�C�^�<
@�4F!��@�BP���b@�o&��@���A���@��l@�]��Gu�@ĸ,�6$@�%���m@Ǧ��ک        ?E��k?n1�'�?�s�hЀ?����u?��b�f�?���/5*k?���+?�Qf���U?��l��qv@n��F�@Aj'�@;<��@#�� *�5@,�T�R@4���\B�@=��r��#@D���ˁU@L'(����@R��@X��P`ԣ@_�m:�h�@dL/��X�@ib��#�@oKc���@su�+�;@v�3ֹ�@{ �d�)@��g�9]@�������@�S��X7@�\�v��@��`�b�\@�u�{d�@�`�*$h�@�Q8�ð@�\����@�����K�@��I��@�����@���ԮF@��F��B@��Sj�5@�TvR($�@�Ύ���+@�Z� �]�@����.�@����,�$@�t��P5@�S_)� �@�I�zSdS@��_� _@����v؃@��9���@�P�O��@�RM��F@����8EH@��ʊ�k@�m����Q@��j��<�@�'HT+"@�#i�E9o@����̞@��.��w�        @ZT(D��@A�뱰v|@e/�Fd�@}PeΛ�@�p`��y]@�e�jvΙ@�i�Y��@�C�����@���Ք@�LI�@��S��q@�y���]�@��% �O@��S��@ѝ�G�@ԑ��&@�����B�@�7�<@��¼H��@�o��@�X9o[u@��Ѝ�@�#'�yj'@ꤳy�@�J��0�@�l���@��o��Q@�q|��@���=��@�l��A�Y@�;d��G@�!I1��@���*�K@�7/JWwA 4��!A[px�OqA�}hj�!A�S� *A'���A���C1�A���o�A	�pS6<�A�n���A�� ��)Am^��A��ϕA Z��EA�k���A��xK��A�N�r�A�(����A��)镍A���_GAuj�:�A%�ıA�AE��`yAl��6�A�%ʮfA�n����A	�$�m�A &~̆�A ��R=gA!u�c
        ?pXr9޷�?��m �?�X�L�a?�Fz�DHx?�>�]�R?���)�.@ �ҽ"T�@�V[�z@�,���@Ҧ�Pn�@���f�@�<!�ΐ@ D���(@"�f��@%���ʺ@(ed�\�5@+R
�Ju@.T�U�!@0�ݵ���@2J��5@3�<;��@5��U��@7=܃��@8�s���@:��#�ɯ@<�j�%�@>Yĥ ;@@�*'=>@A�5�V�@BJ�O$C@C�N0��@D"d�x�"@E5��3d@FQȭa�@Gtι1[�@H�+y�B�@I֨J/��@K�g�F@L` k�S�@M�Zؚ�@O�;�@PE�
��@Q�����@Q�=���@R�3���@Sy���%%@T[�^�=w@UE�1�ns@V8�Tr��@W3��;�e@X6��EK1@YA�F�@ZS�?�0o@[m/'�*@\��!��@]��Ǻ6)@^��?�@`[d�l@`����+@aH�{��@a����e�@b��&3m@c:�X�HD        ?doZ�zn?G�	2�?j�)���?��5?ݞ(?��Ƭ��?�[Wb@Su?�VS&��?����(?п�r�n?�?��1?�{��~O�?�d˃{9@Gj�;�@�Մ���@
�t<�@ ]�ٔ^V@'�.#"z�@0��)��@7�`p�C@?J2�!��@D���N�G@KE��F�@Q������@Vgp��c@\,��ܟ�@a�}��:&@e��|��@jF �_��@o�5h�@s3�z��@v���o�@z���ᡛ@J����@�;(���?@���%�@�V��@��N��8@����`Ю@����?�@�l'��D�@��
J`X�@���#��@�α�ZH�@�	
�T̯@�ʂXf@������@���T<�}@�ּQ[�@�  ?�1�@��i?)��@�M�H�@��A��	�@�Y���k�@����#� @�q��y�@�	c[|�@�����+@��*T�r%@��00�?]@���'��O@�X�T��@�p8�% @B(sm        ?rǽ��?�k>EA[�?ɂm8��O?༃�}�?��mm�˴?��6F��@_�i�@�n1],�@�m�\�v@�;;��@#�����S@)��N>@0���U�@5x���_�@;�1�"|}@A��ω�@F>0ls�+@L^��%@Q��=S�@U��ZΊ�@Z�ayq0�@`S 9�$�@cČB��@g������@lE5��#@p�f��@s��n`@v�y�]�:@zB�h�@~�Oͨ @�"��3@�d���@�����<@�i�t�L�@�/ln��@�"[Yo#�@����=��@�J����>@���įs@���i�@��ct��`@��b$��@�(C��@�z�[���@�w���b�@��Y�e<@�!_�rv�@���Kg(�@�����@��f6Nw8@�`�f'�]@�&z)\<]@�k�NZ@��n�L�@��2U��@��;Z�@��XZ�o�@��i0b��@�$����@�p�5�#�@����j@�7�D�d@�� �4#d        @0�BՄ@e���2q�@�*+_K��@��$�0�D@�6'p���@�	d�!6@��?��-@ķ��J��@ʶVRq+�@П5��h-@�!�=�3�@��&�V(�@��G�@��4~��@�ڨU�@�>�y@�{��t@��\�X��@�}܏�n@��q�6@��Y0�͘@�7pD���@�}�H�@���|��$@�{8a@f@�{N�u@��-��S�@�N���"�@���A��@@�J)ΈZ@�����ӂ@�tNq�}�A ����9�AjŪ��AMd�.A8,ߕ(6A+�2��A(��]/�A/�4	�AB��q,@Ab	�9��A	�o��QA
�ĺ��>A��\[�ApS�h9�A�X�A+Չ��A��p�FA���B]OA��\<�Ar�rF!qAX�Z*keAFd#�=�A;�� VA7���A;K����AEV�y�AU�.�{�Al'c��gA�DȠ��A�ù%%>A�X��E�A�����        ?D�>i�?��}��A?���.��u?�� ��?�����?�$��(Ҷ?��s�@�?�2��Vڭ?��ww��?�����6h?�͝����@ =�7R��@O� "�@���lW@
#a�T�@�^��5,@�~��@5���@��J,�@4l���@���1@%@�"�@ �#&b��@"�<8�@$��=���@&�3�J�@)e"ӁT@+���J=@.&����@0�+��'@2�U��@3�#�._8@5k�w��@7N)\��@9R�v�E�@;{S� q�@=�h�=S@@�j�M@Al췫@�@B�Ұ���@DD�5�0@EϬ����@Go+����@I#��[-�@J턄P7�@L̻�C�@N���N�@Pf���S@QvN���<@R���Ɵ�@S��CbPY@T��_o�@V(��$	�@Wr�n�I�@X����Z@Z+)x�V]@[���U;�@]��+@^�I4@`=f��;@`��+�.@a�����@b���`gE        ?��<l�}?F�&��� ?p]�|�^�?���_�P?�:�TL��?�N�ш��?�Ƶ��o?��J� �?�u�|<I?���̕vu@'��=�@Ī�3 @�6k(@'T�{��@1���e�@8>j�@@՗F��@F�<���@N�H�f�	@TWN4%�@Y�'��W@@`{��0@d��gs�@iɹ�Bv�@o�����i@s\�`Z@wk:] @|͘�S�@��Y��A@��j�ti,@�O�^#@�C���@�����}@�Y����@�!Ƞn�@�9=�GKG@��AN~�@�k�?Ñ@���	VR@��警�@���ݮ�X@�6��5�i@� ���4s@�GO�R��@�V&y��@�)����@���lW@�4��P�|@�o'�H0�@��RH.��@�R�"���@�~�����@��ҥʻ�@�d���[@����7�@ƛ��:&l@�VYi�1h@�&|IMI	@�]���@�c�2�@���i@�"Y݇��@�C�(=�        ?[�s��?�܅fs��?��Qq��?�-�҆?�J����?�т��,?�w���?�oaD�'s@����{@C��@�����S@!g���@)�^�e@2�YD�|@;��v�6�@C��YP��@LY�6]@S��2Ej@[*/e,�@bTP(��@hVLfԴ�@o�,3nt�@t�$c�@z��$�@�\���w�@�K����?@����<a@�6Z�a�@�'
")�@��&���N@��.V١@�ׁq*�@�S=�n�@��m�8�@��NB
@������@�_�m�2@���Qo1.@�q��l@���inV�@�����5�@��I��@�h���@���f�Uz@�LzHO@��I$9@�|��bl@ę_z[`�@�#�F�1-@ǻF�q�@�_�S]@��h�em@���6'@Λc��4�@�9�#oU�@�,qU��(@�%�n��E@�%c��	@�+߷Ϝ�@�9$�@�MH�Z%@�hb�[��@؊���v        @��p�@Q�H���$@ucD��@���ws�y@�����P�@��q�#��@�]���F@�igÝO^@¦�5�B<@�u���@̜�>9,5@�e3+\�@����e%@�}η�c@�]�<��"@��H��\(@�͐���@��<�i��@���@�/��)P@�()��J@�*cR��B@���!#�@���*#:@�hE��@�ギx@��]#�2@�z�b�|�@�[w
|\@�V��K@�n��\@��VEB�A �p�zx2A;ή��A���;A�Xf$eAj!O��>A���/FA	� �g�AdB��_A?(�
%A4+� D3A��SYH$A����N�A�m��"�AF�70AC�]X+A��
`ŤA�ֵ�lWAB�1��A�pd�k�A,� t��A���S�AI�X�JPA u�T4�A!MFQ+
�A"+�[�_A#�:�A#�b����A$��jN�A%�}�UA&�V��1gA'�\��        ?|�\���?�.ԱQs?�<�:��?��5ؒ�?��hӖ�+@�Cn�<�@ʯ;@��@�U+�@��:��}@ =��L@$	wO�}@(?*M=�@,���M��@0�����@3��G=�~@6�(�m[@:5�M�+@=���)�T@A��Q0S@CO9�@E�;��� @H����,�@K�p�\,@Oa婈@Q�U�@S����@U�w�`B�@XB0�0�Y@Zʛ�5o@]z��� �@`) �&t/@a�i�a
�@c;t/Դ�@d�y�y�@f�Sn/5K@hj2.Z�Y@jK҈ {�@lA|����@nK�d���@p5��(*@qP�,��@rw�p�߀@s��]�C�@t�O���n@v=�4�T�@w�Zs�@y�G�X@z�3gl@|"���?�@}ɞS^�@��U��@��As���@��ؿ���@���'� �@��z��@�����@�ʥv/�6@��]8c��@�"���Z@�_T+�l@������@�����)@�U�-|�"        ?S%!�(�?�cU�(?�.m�;��?��G�0>b?��ۋ;�`?�fX�:?�E7/�'�?��A��@��h���@�ii���@,fN,b@'+Ԓ��@2�E	G�@=�I�s@F� B��i@Q��R�@X�+���@a�Uu"�@h㾓4K�@q�;��@v��v@~P��j�@���u?w�@�>�+��@��ܲ�C@�߶�ξ�@�yey}�o@�̭2�;R@����1@�j��ű@�R�c�bb@��ηq�@�Dd~G�@���M~�@�ߜ���o@�y�	cd@���f���@��?�*	@¨4�kK�@��(��c@��x�h*@Ɉ+:�k\@��e@�@��1�<�@�ӻI���@�Q�?�@��	�?�@ՂB� �7@�5L�-Mx@��=�A�A@��*�v�O@ܺ'H���@޵D��ǋ@�aJ���@�q,�=v@�%x?�@�[In��@�� +�yS@�#ę��@�K韉�>@�yX5�@���hw�@�C��*�        ?�@�[�?Z�=���?��l@p>5?��Pi�H�?���d]�?«C劅�?�K+P�8,?����p?�î��?����(@v#s���@6@�� �@�J�5E@%�V�W��@/�ST�`�@6�s�\�@@eG^@@E��yb�@M{�2m�@SdFo�@Y��D|)@_��p��@d^��p@h�2��`�@n\��#m@r` n�@v[���b@zb+zs@~��/0?�@��g�}�F@��]��K@���}Mz@�J��C�@�+Q�@�������@���4�J�@���S�N@��1�t@�Km�4�@�4^��@���4���@�Q��N��@��KY�@��� eC@��׎`q�@���e�O@�TAξ�@��@���@��J��R�@��hS���@�FA�8\�@����[�@�9HS\�Z@��
�Sxw@�r��#��@�*�(@�P@���U��@��p�3�@�a��f�6@�c�&|�@�o�p��@Æ��|q@ħ�DQ�`        @>s��o�@y5.iv@��*dvU@���A��n@�O�fH�@�T<G:f�@�ٮ�:!�@��|<jk@�{�e�WX@�n�2L@�v�4�6@��!���@z���@�a���5@�/o�8�K@�@�����@�������@�]5 [�A���i�A�Ͳ�A�n�HA	��E=aA�<SQ��A@�MCMA7��o֍AX��A���&pA�WLP�A��k�nfA{0��9A �%3��>A"I����A#���V|)A%�e���SA'�m�T2A)��ePp�A+�;`kl5A-�����A/�u�$�A1*~�*sgA2h2p��A3�q��)VA547�s�A6��ǾM�A8zE*w�A9�'u��A;D_aXe�A=F��A>ڿTuC�A@dX�5A�AAg}��ABw3�]`�AC�ӓa��AD���a�AE��+AG:'G��yAH�^x	syAI���G�AK_i8�UAL�.��oANn{s�m�AP$2JK�APߒԲ�        ?���gU/ ?�����<?���Q?�.ޔٻ=?��l	��@춺��@��>�M�@�S�bK @@�^&u@"X12���@&g��i8@*ʷ�޿@/~���@2?�����@4�Ƒb�@7���+V�@:���I�@=�_��@@v"9w��@B"�z@�@C଼C��@E��;�@G����&@I�q���@K��,X�@M�ډ?T@O�C"��@Q ��`R�@R)�V���@S\��'b@T�����@U��*�_@W7|~�+�@X��ݰ�@Z ��v@[vT�i7@\��6`�@^���q�@`h_�6@`�x��s@a�����@b��:ב@c�����@dn�j�@ea+j�U�@f[2��I@g\ke���@he#5�|�@iu�%U@j�U8T�b@k�f�!N@l�����@n��z*!@oG!��@pE���F@p���>6@q��S�)@rG���T@r����s<@s�D�+ms@tp���
$@u1'�{��@u�Y< ��        ?T	��7<C?���)���?��,k���?��!��?��e��F�?�o�J�;@�1��@��̶�}@�6|��v@ZP���j@&>ߋ�~�@.�02���@5�ɧb�@<S����@B �S�@H��v��F@O�)��ơ@T9dԠe@Y�L��g@_�|6�@c���Bo@h��ۦ@m �V{g@qt��}��@t���8�@xfp�и@||G��c@��L��@�����Ê@�����@��8e�@��>�"H@�:���b�@�uݹ��@�q�:�h@���L�C�@��1��iX@�I_�yE@��Œ�j�@���5���@�SR0j@�����@����VU@�djHf@�L�rɝ�@�Rҗz�P@�xj1�W@������@��y��]@��u� @�.q�	7@��4(!@���@�l@���G��@�K?��T@�B4}�@���K	�@��e/1�u@�^��C@�jn�� @����@ç�{!�@��F0�        ?[|�ݐ��?�@d�h��?��kIbO�?��í��?� ��w�?�0���?�~��_��?�#���"�?�Գw�s�@�)���@������@ʤ�牌@��R|@&�㗗.@/��s�jB@5��*e�n@=_�S�&@CfP8i�@H��ϡ�@O���	�@S�0�lo@X�a��b�@^�V㉧@b�)GDu@f�����@k/����@p9 dz�a@s=K>MC�@v�b��� @z�Nm�@	����@�`u�@���!�@��Çm@�o���U@�K�.�k@��%.]l@�ZU.=�@��_�Z��@�y�(��@��^�%@��'EAF@���Gp��@���M�ko@��B�!�H@��jAc.�@�#"/���@�����F@�:�dM;Q@����N�@�u��A�q@�����[@��xyl��@�O��@���|16@���F��w@���O���@��5��X@��l��G�@��Bxq�5@�ʐ����@���Vy�@�B�"���        @7{/��@q���Q@��~&�@����%��@�AH��@�:����Y@ǝ�:��@��1h@��_��@�c�]�k�@�)����@�ab�`�@�ձiFt@ꃫ�kZ)@�h�-�T4@�A"}��@�g��5�@���X��@���z�O@�r,)�@����Ϯ@���QA5���^A���z�gA)T�n��A�
l���A`�����A	��NA
���7�A�I>��8A�P�|b�Af���{Az�䢅A���RA�$V(��A�tN�AL� *�JA�{c��~A	 $��FA}����^AEL�<A�����_A7��;�A u�+.�A!XT�a�A"C��iuA#9$���A$8l���A%BO�U��A&WP.xۓA'w�c�z'A(��ƎxA)ݜ!#��A+#s$���A,v\�K{�A-֘��k�A/DVp�DA0_�>Æ�A1$hw~��A1��k7�A2��g��A3����6_A4zp��        ?�l��?�p��^?ߌ��7�?�M�M�M�@�̦���@�1����@�����@!�&�|��@'�"�~<�@.8f��?c@2�f�п{@6�^���@;^��\#@@�L<��@B�	�@E@�]��?@H�ɘ�@KŽ_��@N"R�"z@P�94�n`@Rg�a��@T0q���3@V!o�T�@X�\Q�@Z�%�@\3ۆ/�@^o�[�k�@`b%H���@a�͛�Ł@b�L��@d,Jg���@e��	�q}@f��h�ny@hm����@i�<|��@k�ڬF��@m2@�|
>@n�y
��F@pY��pjO@qI/�L�@rD�5��@sN0���@te����@u��pkU@v�[�lz%@w�0�(�(@yM$e���@z�֣��@|���w+@}�'E�p�@S���@�F.���@����P�@���}�j�@����v�@������@�x�X�	[@�`��	�@�M��X�M@�@����;@�8��o�@�6}G�E�@�9�bm,        ?Vg^��aR?�-�B9?���H��?�뱓2�?޿��*(?�є3:�?� �xX�U@������@��@eo�@Ӑ-� �@#�b��@.�j��i@7�%�ǎR@A�?��_�@I��9S#K@R,UM�@Y*O�v@a��^�)@f�5��\@mV��0y@r����S8@w�c�e@}�x��&@��1��@�Prf?�@�\��"�@����m\X@�jtll��@�$I��'@���˙@�V����@�ӑ+o�@������@��vu��@��!+�'�@�I GV�@������@�b&C�@�.w�e��@��Dף@���Ɉ �@�S�=�D7@�lg	�@���2�@���PAL@�X�듧@�@:��*@�I��ss;@���1��$@�΋3@�@�*���0�@Ř�t;9�@�f�@Ȯ�9e��@�XlY��@�dأq@�곤ٞ�@�����ۚ@��n,�k�@��T!�-J@�+kĻ�@�=��C\�@�t��3�        ?���s^�?�ZȆ!?�]=�hb@0����?@���@!����1�@+%���y@3;G+V<�@:�U#b�@A3s�/�@F-SJ�ap@L��W��@Q��n՞G@U��O;3@Z�feh��@`39�h}�@c�k��>@gG���@k��O$y@p4�T��@r�򴕢c@u��>�;@yVg��Y@}��Fxp@���j�g@����@�����@�]y�b�$@��yX[>@��2"��@�j�Nb@��p�WJ�@�׾���$@�a�~��@�'��t�@�-��YX@���/A4V@���3� @�s;�g�@����/�X@��LK��@�6�y�J�@����k�@�MH��e@��@��@�_����T@���Ij@������@���ڿE+@��e���@���c�@�7����@����$&K@��Dg�E@�&	�kF@�y����@��PW��@�P�C��@��GRw�@�g&a댱@�8�X-@��FA7�@ό���C        @N$����@����BCB@�e5(.�J@��5I�@ͤ3�	@�=���
}@����P�@�˟n7�>@�V�b�`@������!@��:Tٜ�@�7��e�Aff���A{h{�!�A���bRA0��3@�A͉��qeA��ę1hA�av�yDAӏ�X�A���9�A4����NA�SOf�hA����A ��t�A"�����A#m?�y��A$����A&U4o�J�A'��lM��A)wqW���A+�r
=�A,Ն��>A.�����~A08��	A1+�N�A2'q0���A3+�H.$]A49��ɜA5Se�A6zB�A�A7��s7A8�_�/A:R2�A;��5�A=:�m/%/A>��7�A@3˵�3}AA*c��rAA�o�8ѥAB�,К�AC�D�]��AD�����)AE���A��AF�]���AGǝ��k�AHܖ��AI�pj\�IAKf���eALK�?RI�AM���v�AN���}��AP�� �(        ?���Ħ9l?�
�G�?�9�/\9�?���f{�?��<'�s�@��p�@�$(�K~@Bߩֹ@d���9@ 3��Q��@$(K�=@(����l<@-w�E�Ë@1mJ~�VR@4`��[�@7�^�kL�@;�̤�?@>��2@A}��5��@C���<9�@F����,@H��J��@Kak��U@NL�#Qv�@P�I��!@RW�/�M�@TDY���@U�с���@W�����@Yێ�*��@[��_��@^1���@`@ȃޕ~@au�R�@b���T�)@d>���@e[2�-m@f����"�@h2���I[@i�d�ʤ�@k<�D�Ƙ@lԿ�L.[@nxӢ���@pY\}��@p�x�+�@q�AzM0@r��F�r@s��:��@t���;�@u�5��5�@v�2�gR@w��� M@x�*؆�@y�$��7+@z�Xד�[@{۠%��;@|�ѺC-@~�}�A�@A�|�w@�6�9G��@�ϛ��l@�k"Y�@�	�,y��        ?"��;":?WS5���?ySmˑL�?���5�?���b�u�?�al��??�ƻ:�?�z��%?�Qٖ��@ �����v@͛v�4�@{�[է�@$�,B���@0B�����@8�!��_@A�Z�1@Ibl���A@Q�t���@W����cH@_i�(޶�@dn���@j%��s�@p}���J�@t�n<<�@yB��x�@~��L�	�@��r��U�@���ڞ@�3��Y�@��P�<Y�@��u9V�@��i�yZ�@����(�q@�z���H@�L�t�_W@����x)@���Lv�@�y�B�@�#����_@��שB�@����e @�5e)�@��N]��t@���Ȑ�@��1eq@�3��:1@�V�Y/�@��"�f��@�+(����@��5�j] @���0k �@�z3�b��@�Z5��@Ǿ�ًs�@ɀ�CK�@�X���@�E�����@�IQvFP@б��	�n@����a�@��i��s<@� K��"@�]�ʹ        ?�z+P���?������?�^�{b�4?�39��1?@ ۨ���2@
Ѫ��G�@jl���@��C]@!~���og@&���Eb3@,�w��@2T�Ͽ�3@7;w�T ,@=o1��U�@B�ɤzv�@G��P�t�@M��I#�"@R�Sz�4z@W���~̂@]v7����@bA�o��@fu�vY@kg�@y�@p�A�y�@s�L���@w��ȗ��@{�Q^⇙@�\��2��@�U7{ m@������@��U<E�@��qh/�=@�%=�)u�@�&!�z@�J���l�@��j��̾@����D��@��u�`�@�?�)��@��~0@�	?Kn~@���/��`@�<�zN�@@��Y7%@������Y@��Gԛ�.@���i��|@���8[�h@�Z���=z@�tkL� U@��%��B@�����@�c�H%D@�KH����@���E�>3@���t�Oj@�hJ���@��%6c[�@�e�i<R5@����R��@�Mfd��@�%�ƟI�@�N+�}l        @=aj� �@r'*d��"@�-�/x��@�U�A�h@��Q�д@�'�I!1�@ĸs����@˘�)��@ђR�B\f@թ�끐@��i�X@�����0@��
zc�@䐓��G�@�c�vb/C@�_�����@�)Y}��@�k�TzZ�@�*�$h'�@��|6�@���7�@��W7�ժ@�%]��C@�kϵ @�@��T�l�A �>��A�@5�)Aj���q	A��^k�+Ar_.�A16A	�Z��lA�\z#�AkB�2�pA[99��LA��@�0tA����!�A�y�7��A�?��aA_֡v�AS�*���A�P�~Aߘ6C0	A6"�V�+A�B�1~�AM�O�7A����N�A �iɄ�A ͋l�A!�� ��qA"t�.bN�A#Rț��A$7����tA%#\`�ۮA&}KզsA'-"^cPA(�s��]A)T0�"�A*1L7<A+L�L՗A,q�W(A-���
A.�㼔�        ?A�â��?�%�UgB�?�b��F S?�4rk,��?ŗAm��i?��zV�im?�,�:�Z
?�Rh핳?�_�Ժˡ?�}��|�?���ұ�j?��(���B@����@7��1�@
�R���O@���Ao@�.�?Z@��
zM3@O��(@Hˀ�@ ��Mc�@"��S�/@%�EgPv@'���)�@*m?���D@-f���ޞ@0K��3��@20��~>@3�Y��E@5�,�D>w@7��(�@:F��@<�1�k-e@?ҵ�@@�W6�@BX��|�w@C��0�Gt@E�U���@GM�>ۑ�@I.tp��@K0�ߑ@MU�"m
@O��7)�@Q8�E��@RctI}u@S�Gn�9@U^�����@W7�B��@X�g���@Z���Hz@\�z��0c@^�����@`�O@;�@a�C�z@b�����*@dJw�L�@e��"���@g���x+@h�2�w5@j%?z�6@k���.�@mm���:�@o'�|i        >�������?C�c�?l�a�d�@?����bô?�/����?�[�!zݭ?�
���?㌺Ne9^?����"�@j�M��>@�ˑl�Y@ b�8!W�@+�!���@5Ua`�-�@@#�r�R@G�o����@P�\�2F�@Vƚ��|@^iИM��@cղM���@iU�2�@o�0��>D@s�/�=o @w�F��{@|���@��E���@����g�@�*��>�@��@\|;4@��G��\@�����~@�����@��Y�:Ka@�rz�q@��\M�@���"
��@��\i��@�����@��OQ�"@�GOqY5|@��YW�l�@�y�qM��@�.�_J�@��~K�@�c�Iq�@�)q�@���^��@���!4�@�7����@���q�F@�� -y�5@�@�ϋ	�@����@��p�@ś����@�<��;@��p����@��$G|�@̹Dr�#�@��W��:@�w��I��@ѝw�U?@���>��l        >� {H�?7x?�*?b�iڅ�??��C���?�� ����?�ʥS�d�?�>@�?��?�Dyl�x?��TZQU@��Х{z@\lE$�x@(�R���@4�*s(E@?H\TG��@Go�!4I�@P��F��@Wޗ� ��@``����@f �ҟ}@mXv�n@r��4r7�@x	Pv @~J��:v�@��5��x!@�*s��-�@�(,����@���F-}@�'�*:@@��>�#)i@�ɷ�EA@����X@����:�/@�,ԭ��@�C��)e@��|�K@�h/i':�@������@��'����@��^I�@���eM@�!���mT@�u��E�@��c��n1@�;���@���(��@��eΑP{@�o��H�@��p�Z�@Ǎ\=�m3@�4�Th�U@��e�v~%@̷ܚˡ@Α���c@�?3��Έ@�>.��)@�E��r��@�ViS��@�o��+C�@ՑK����@ֻ����@��x�h"@�(�_EJ@�k�@pm        ?�6��'�@2�>Huj?@T�����`@j\�ǀ�@y���'@�VI�CV�@���@���x��!@��C��@������@�t�%�@��3l���@��)�|@�I{��@�h$�X#�@��(a�~@�/�w�!@ȟ�oໟ@�^�۠{@�8Htj�K@�l��[`�@�Ϙ!�W\@�b0H�?4@�&A��.�@�<j;�@�$%f*ī@�����y�@㢐x���@���@�S��@��gB�@�#�|��@h�9a@�䑬 @���q@�ز�N!@�=��!$@��b�}�@����k�x@���\
�
@�/���@�U�����A �.&���AH��T�+A��N��AZu���A���NgA��/��A
�ؘk4�A$�8n�A=�U2�PA��~NA���)1A]�j-�A��sB�A0n���A��wM2"AE!�\�A��I�:�A��݂qA]��aՅA B�HR*A!	@+�,�