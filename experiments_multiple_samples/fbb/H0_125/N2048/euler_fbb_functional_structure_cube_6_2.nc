CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T103807        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�*9k�H-?��e��@
tS��>@�J�g��@,OK���H@6�]�?�@@���HR�@G ��s�D@N���1��@S�OC��@X��8R��@^4uu��@b=�鵨@e����@i��x�K@mߑ����@qH<m��@s��[L�@v�
�Y��@y�s�g)�@}�9ꏇ@�X7X��n@�P7C��@�r)_� X@��`�E��@�<��ب�@��as�b<@��%'�\q@��Ib��@���"��@�>γ��@��݄�@��e)j�@��[	nJ�@�:��҆@�Zpm(e9@�X��Gߑ@��ԕXH�@���9aR%@�.0�+G�@���D_�@�w"��@���H�]@�obW��@��P�v�@�Z:�@�ql.j�@�k�uh��@�U,��U�@�D��K�@�:8��$ @�5�\>�@�7��Ki�@�?e_=�@�M4ebvg@�a�p\@�{�X�@��]��\@������@��ɝV�@�"QW��@�[�ҏ�S@�Nw�        ?�2�����?�ti�_�y@s)+��@!�P��N@1�3-e �@=��b��@Fܑ�,Y@P��9�@Wwb1�B@`
#�kv@euO݈�'@l3^%��g@r?T�Lpl@wJU��Fy@}Z��J�@�HF"��@��ҝ�V@�y���@���}��@�ߺ=t@�����LW@��Xy��@�B�	���@����RM�@��p�*W�@� N��R@��:L$��@�-�Z�u�@�EiK�Q@���,��@� ����@����D@���G�ֳ@��=we��@�{�O��@�E]�e�@�/��e0�@�<�лZ�@�m �c�Y@��zд@�?�^�@�rH4T�|@�ڎa���@�Yt/�p�@��.���@֟��)(@�i-����@�M�����@�N�J:�W@�l��@�O@�TIy��@��e�F�@�p�WV@��!�m@�l���@��QA���@�`XFD�@��P���@띷�r#@�Y�?�I@�)淕��@��G�ӱ�@�H5�        ?�L�p�!?�����@݌�� @,�bDR"@<�2$��@Ho��X�C@So���@\���@c�9�e@ke�x�G@r��'k�@x������@�:#�nV=@����o@�,,��@�Phm�9@���r�P@�L�u�6@���t��u@���P鰷@�-�W�B@�V��q��@� ��Y1@�~<DL@�KrSf�@��͍�Y�@�&m=T��@����j,@ƫ9���"@�Օ��@�HC��y�@Ђ��<$@҇J�hRN@Բ�[is@���d��@ق����@�(Kt��@��Uy�7~@����R@���@�.�=ۖg@��[��: @絑�x�F@镨5�^�@����@�@j��@��&�B@���E	`�@���!i��@���D��@�=�ڭP!@�hp:T��@��3f�@���@�0�i�@�?�ľ,�@��s��@��b2�%@��f�w@�L��� �A J��a<�A �k�f��A���/��        @f�����@����K	@�b)~�0@�ܖ���r@�g-t�@�Q���C#@�K}�H@��0+��A �_~�a-A|R<N@�A
���;��A7᪷�Ak�p=�|A�n�0�A��`��A����A!�ީ@E�A$q�p�A'7
�_�nA*8���A-z�v��A0*�x?�A2daU4�A4m��YUEA6�ȳ��A8�;�\A;x%X���A>$Yl��A@}��;�BAA���-�AC��s#�GAEB��~��AG�4��AH߀^�(�AJ�6N�[AL�L�0QAN���I,�AP�����DAQ�=*��AR���*�AT29���RAU}����{AV��E/�AX84>zAY�/�E�DA[!�8PY�A\��,�A^9�yeCA_ֲb�$�A`���e$�Aa�_n�xAbx��Fj�Ac^od��AdI�Id�Ae;:�S�Af2�FkAg0o�w��Ah4h��?Ai>�`AjOw�ťAkf��JAl�?��8Am�]�]r�        ?���6���@i�Xz>�@ A�;��b@1��P�@>۩����@G�֦�L�@QdJ-7@W}����@]���c��@bى1�u�@g �9�Y@k��}��@pn��*��@s(h*�^@vn�&_�@y&� kZ�@|id�躊@��5Vm@��φElw@��V;��@��̮M�@������#@�����@��t�@�X1��u@�a��~�@���ܠ�@��/�j�@�I�¢"@���SINh@�!�ȍep@�����fj@�,.��X@������@�h=ޡ�T@�k�R�v@�j(��&�@�M���Y?@�6��/,�@�%�@�@�u�g�@����ĵ@�$�~@��.Z@���[[@�,1�RR�@�?���i@�X��0A@�v�I�:�@����k�@��P~@��ɱO�@����H@�,�RbZ�@��Xgh!n@�lE��e�@�ɂ���@���XTq@�^ϔP��@�
u��o@���-��@�j[(bg�@��~�VQ        ?�ՖQ��k?�,���r@ �U�X@��m.�@"�)��ɵ@/�P��@9�=}�@C��g�34@MT��W�@UNN�]z@^M9�o��@e#_[C)/@l������@s��r _@y�M�|@���]�!@��s���@�~��H @�5��zH@�H5 @)�@�3�3�@�y�	�z@�ؗ����@�[�����@�KZ�d�@���+��l@��b�@�ke]@:@�Ti�3�2@�Y�b�E@��wv5ќ@��P��D@��V�/�B@��O`�Q�@�B*�/V"@ɶĶD@�S&g`i@��i�@��͐�@Ҕ���D@�9j/
-�@��y,��y@�������@ٮ��.�@۬�����@�M�,<@��R��gq@�θa�W@�G麟��@�?�0�W@��!8W�)@���Ȥ�@�}�\$�7@���u�@�i��h@����]�@�roً�@�9 S��@�y?ٵ�j@�]�
��@�J�SD @�@8L���@�>1ng��        ?�i�����?�}���}@:w���@$�v�"�@2��R N@=寉;K @F+)l{�@O]d�N��@U}��/�d@\���|�@b��+9�@h����@@oc`h~J@s�^}�'@x��/q�z@~b��lէ@�uЎ3'@�*A��@�R�^��@���	Qq@�����@��J��@���@Dx�@�L��\��@��'T��@��_Z-�@��1*DD�@�+��3�C@�����@����F�+@��'<�
@���{��@���H�@�ɇ}�8'@��,r4�8@�V�{?�@�vhz��@����>RU@�X�8�@��u�.�@�Ix��\@���Ep@Ƒ�\6�
@�V����"@�1��Z��@�"���w@�)��Z�q@�#Tl�!m@�<�8?i@�a�_1�@ӑ�����@���֞E@��Oy�@�f��A@��ݣ�Q@�.�r @ۤ'k��L@�&�����@޵�'���@�(�z��@��g��k�@���_��j@����        @w�	ca�e@��ծT@�%�f��-@ݒ�&f:�@������@����(@�^c�9�A��j��A�բ��(A�ik�qA��� UA�+��A��N.NA*h�D1A!�'�A$Zڄ�A&�Ȁ��nA)��I&!NA,xSK��A/lh(E�A1@)�,m�A2�p��dA4��E�A6BQ|��A8��}�A9�l�;A;�ܜC:A=��EA@b���AA��[t�AB<��\�]ACg�P;FHAD�,�O)�AEܡk �AG&R2�<AHzB�<UAI�cK��AK@�_�&AL����7�AN.6Cu��AO�5oʆ_AP��k��AQl=J��}AR<0Pg9�ASp���sAS���:\4AT�w��'cAU���n�AV�u�m�AWr�����AX^wD�>AYM�CHrAZ@�"�vA[6�7%��A\0�時�A]-�dA�A^.�r��"A_3C�o>A`�f�6A`����@Aa,/��Aa���;/!AbCU^�        ?��¥�S?�0zF���@%̱ �@�w\�@)���]L@5A�����@@pd�e�@F�I�.�@N�}���@S���r@Y!�����@_���m@b�ɺ�b�@fg��?u�@j[�y��\@n�
C��5@q��f�@t(Q͐��@vՐ|�R�@y����@|�Dn�@��k��@����@��@�z��~f@�c'_X��@�f�+�y@���Yv�@���5T��@��3��@�Mg�d��@���2tF@��Ίym�@�fۂ�8D@���U��@�r�Jb�@�|�i�@��X�^��@�u��-��@�=��N��@�	���E�@����}��@���0��@��38�g�@��_ٳ@��t��0�@�����@�'�QO�j@�H0kk@�p�I�O@���<�'1@��S�Zc9@�qn,7�@�h�^A@��I���@��x2%�n@�=�(�@�����@�����h@�m��3@�1^��`�@��_��w@��ס?�@��ծ�r        ?�pG�;,=?�6Ǥd�@��0`}@%�,'e��@4��f{�5@ABC _�@Jq��8�@S7�z���@Z�}(Sy@bs9�g@h�=V%�@pWD�tI�@uAI���@{FKYΏc@�I%�׻�@���lwH@��I�m�@�}�p:"n@�[}n�@�+G)�d@���׎�@�:U�@�mo���@�j�P_@��g@�'XGX��@������@�6�ƣ��@��jF��@����cD�@��^?S:@�_��8�@��o�G�@��Y�2@�ۯ ��@��t��X@�r1x1��@���ޘ @Ϩ���A�@�AU��@�ö� �b@�[߱�x@�
���A@����@٪qd��@ۜk�Lr�@ݦ0�H�@���,�=@�;$W@�*��aG@�al����@�e+h$�@��~�y�@�V��5?H@��x<�c|@�@�PRN�@�ˠ��R�@�e+��@�l�x@�b1 �,d@�E1��@�/->�!@� ��f5        ?ʢ��r?��@p���@�S�Nz@1��q;�@Af��m @M����@V� �@_b�=��@eq����@lm��t�}@rk�r�@wr#
Ra�@}g�r�6|@�4�O0�@�K14�@�|C{@�:tT�&�@�S�jJ_@����=@�̵��e@�=4�2�L@���N��@���^v�L@���G�8@�=���1�@��n�g�@�w�!*o�@��$�@@�	��g[�@���Ηf�@�j�����@�p�^$~@���T���@C����@�}���o�@ƃAD��@Ȭ��Lߖ@��9l@�q�$���@�<e�B@�k�+�l�@��IU:�f@�u�� @����@��<�ΚI@ٳ��M�(@ۥ�aE	J@ݳ:B<��@��}��ө@�Cv�"�@�C�D�@�T��@��pBӑ:@�4� Qԡ@礼&\w�@�$���5@�Zk��@�U�����@�VpʿE@�ơ?o��@��Av���@��R4��@�3��        @e��lv�o@��W��@�1->,��@�f�V��@����m@�o�}9�@�I�F@�̦�"xAGH>b�A�*� AF|�.SA0�|��]Ayϔ��AeD�~��A �9B�A"��'��A%6�X�A(�'��A+$0Y��A.b�Gn��A0�u�:�A2�܅�B�A4��K�`A6���x�A8�9� >A;��/�A=dW"�7?A?ޏ �cPAA<T��S AB����-�AD���فAE�\Nr�AG;��AH�����LAJn�f���AL42�KQ?ANK��9�AO����AP����#
AQ��%AS	�p�VeAT ��TeAU?6�AVf�}��AW���+$�AXҖ4��1AZǗ��A[e��'A\���B��A^"D�4g�A_��l2�A`�.�4c&AaG}on��AbY�>��Ab���ziAc�݅w��Ad��ܗ�QAeg�QAfK*��Ag5
K�~Ah$�O5��Ai��i�AjJ��o�        ?ُ�GQ��@O���:@&��c�@8���\��@E2X'�@P()|%!@V��hI@^)����@c2�=�*�@g�%Y�@l£�⿫@q�0F?J@tY�ʑ@wFi�ܵV@z��ݳ��@~_�bA�@���7@�"p��|�@�;-�K�@�d�
���@���l	@��Ʉ�g�@�!���9 @�7�Eϓ@�b*r�E@��ݐ���@����G@� )��D@�C�W��6@������@��=�cԓ@�Qr7֎�@��t��m�@�P�1���@��el!@�L��=�p@�-����@��M���@�	�.��@�~JQ7@�
$q�d�@�Z�E@�,����@�H�i��%@�k{=���@���51�@���M�@��3⿋�@��4�'E@�O�q&@�A��yP@��i/��@�x3P�aG@�C�/�t@����@�S�K��V@���r�"r@���a+e@�;s��8�@��[��i@��U�*%@�,�4�#�@�Ӆ%        ?����e?�����@[��3@$�{�@0�@5>_u�B@C8p��~@Ou���I@Xu\��p�@b�v@i�~pk@q��o)�9@x���@�1\��@�x��!,@� ��2@�A?c�1A@�*r��@�_ ��Д@�P��rM=@�s�	%@��2���U@��1>�@�N��f�@�)�	�f@�� ���@�#�D��@��qY�_@�~�A�@�TO��@���g�	@����f@�ϛ�_@�����Y@�*����7@ˇj(6Fc@�����{@�Q��2)@Ѳ��ev@�&v��O@ԭ���@�GP����@���|�T@ٹ��ח�@ۓA!c�@݃-��BH@ߊ+�K^�@��mu��@���S�W>@������@�L/?���@�nY� �@�ۭ���@�7k5<�@��
���@�w��_@왈k~��@�*H�l�@��F�;@�kD�@��G֝@�v����4@�^�fҮ@�LZ ꯡ        ?�&����@�,T/�@1�}$8@@�ui,@J�a=��^@SlI�&�@ZT��m��@a7����@f��]�@l	���@q��b�j*@v1�f��@{����D@�D��#��@�ZC�X�@�8�Z,�w@���z�@�Y3�ۆ�@�B��N�@���Y�f@�|k,_Ϻ@�p��@���[��@�m-S�4@�s��K�@�jB=��@��?_�D@�P��V�@�� =��@��Z5n{@��I�@�N�o��@��`�"�`@Ě�H�Ȑ@Ɓ�����@ȃ�z�@ʠ)���@���Ry�g@�1	���@��r�L �@�`x,�@�zW]t�x@��{��-t@�i��0�@����-c@٪�0.�@�kt��@�B��2�@�0��n;C@��ϰ�@��n�X@��j�w�<@����ZLV@�㤑~@�]"6�[@�r�Nn@�j����@�nb k��@��<Ev�@�k�Y�@.@� ��+^@�Rf�r	@�,b#�        @�)�yL�@ћ��F@�5����I@�C�'�;�A��Z�xXAJ{��nsA=����]A �x	�|�A$�3�uA)����A/��/A2�z�q�CA5����VA9����|DA=�0%���AA/AcS�AC�_}��AFV�ߔ>�AI,=�w+AL$��7��AO9���AQ0�gF�AR�~�y`�ATe�� �AV+�J�AW���_AYE�[^AZ�B$�0A\�f9!��A^BW'jȾA_����x�A`��F�Aa���K;Ab�_	&�-Ac�9�2�Ad��a�-�Ae��}L�sAf�o �D�Ag�>ڑ{�Ah�yb7F�Ai���,Ak>N���Al@�Q��hAmr�X��lAn�χ�ƻAo�u�ΪAp�4^�aaAq-�3��,Aq̞�Jx3ArkMeuDXAs	�+̀�As��'�uuAtE�c�@
At��`�wAu����Av���E�Av�¨3`�AwT�*v�>Aw�r�X'�Ax��B�>Ay,k�܎Ay�K���Azk:� �c        ?ӯX�1�W@��N�@#S} ��@5�wG�!�@CI�v��H@NV�DF��@U�dA��k@]����n"@c�Ob��@h����@n����@r�/
�@v<D98@z'�5�Y@~iF	E�@���u�;@��	��$+@��I=���@����@����ڶ�@��)�7(�@��Kv*c�@��`k��@�����!�@��O�վ@��j��	�@�����@�h�.�@�r�݊W@����N�@��KfH�@��
	�C~@��U�-@�xzf��E@�	o��7@��1N羴@�T�>j�@��\��@�֞�a�@����%8@�Ư���@��
S�rN@���L���@����֠Q@��:T4%x@���A�@��y>�Ґ@�<J���@�1
�Q5@�Y��gx@���%	[G@���K���@��w�1(�@��4��q@��-@���@�f�m0Y@���mK�@¼90v	@�k`{�q@�p.f�e@��m��Q@Ŋ`d�U@�EN�~�        ?�o�؟q�@	��1KH@*���^�6@@�{t�@P[+S�.�@[|�7l�H@e>@6a@n��x*$�@u4�&�^@|��e���@��o.�d@�(Ц� �@�� pЊ-@�.;���@�VL#�z�@�G�%an@��+�\�@�=�.~�@���Җ!@��$�:֥@��s�s��@�KGD!|@��=�5�@���2bq�@�� 0��@�s�u �@��%.
ؒ@¸�4���@��E2�@����6|@�M�ďq?@�˓*=KS@�q��`^@Рy��g�@�(�1��@ӯ]I�@�W��QpD@�Vc��@��,����@�٦��@��VB�[@����1��@���Q&i^@�þX�@������H@�=���CZ@�۹�\�@��8M���@�_`"��O@�ݷ%<�@�k�k��Y@�	�e6�@����@�;K�P�@�#=JPk�@��M�n�@�1!�@�m�7�@���X�@�.ƀ�w�@�K�/�@�r��)@��6����        ?��(z +�@	$V�N4@&A�b�@9��$��@G�f)��@R�7-��,@\9erN�@c팉4�O@k+)?�@r�x�@w��GG�@~:Vs�@�%l+��@������@�� ���@�/�q
V&@��N�О@��ӨMl@���a��"@����y@��;�}@��'�I#�@�ܓf)Wg@�8��1@��9kI�@��M��=@����z@��i���@�M�x@�IH��$@�pJY�_:@��U���@�G�l@����@��^�q�@�4�
y.@ү�����@�y�6�@�a�d@�i�� �@ڐ4m��@�ׄ9�~�@�?��'2@��̴c�b@�:��c�K@���<��@�����@�Ie���@�BR��@��{;��@���5�@�L�@��@�uS��|�@�\M��@������@����h#@����@�����@�N'�E�@���;F�=@����/�@�#g��Sk@�~�?���        @��BZ:O@�Os�Ȭ�@�NfW�@�d�;���@�_քy�A3��_��A
TvϴohA�&�~Aej��dA��/Q�CA",]zՏA%�m>& A)�F�z��A.a�,�ңA1��_u�A41|�A6ʥ,�V�A9�s���A<�1�ЙA?�]�r�AA�%x�J�ACqo8��AEQ�׌�_AGI`�a�gAIX��AK}�h0�AM��7E�EAPa$��ZAQ;(��ԂAR{\�N��AS��ҥ�AU�a�uAV��q$��AW�,�a��AYl�2)oAZ��_<�A\�I��A^*��t�A_��
cA`�n�)�Aa� q��Ab���sUAc���l�Ad��	��SAe~���+�Af��oV��Ag� Y36Ah��!�8Ai��.Ot�Aj�Wa�'Ak��+}�Am�"���AnO��y��Ao�$tv�ApaD'��0Aq~��dAq����9�ArM�B�e/Ar�.,��,As�dG|��AtU��� Auǈ�ǓAu����        ?���ПA'?��Z{�?�J,�][�@�H~�@�aȍ@'��Z@1>R0v@7��ϻ�Y@?'�����@Cֽr�T	@H��A��@M�#��5@Q�=N��K@U%7.@X�ി7�@\]�r@u�@`9{��/@bl�O@d��Bd@�@gN��Գ|@jj�dA�@l�
��e�@o�`�B@q��9�J�@sP�Oe��@u!�; ?@w
ϻ�E=@yWk��K@{&!���@}X ��m�@�g� �@�����@�@V����@���k���@��DX1z@�D�Լ�@��e
}6C@�/��:@���
�@�J��3@v@��-,8\@��$���g@������4@���_�P*@�n��x|h@�Z�cd2�@�L-z�=�@�B�-̡@�>i�r@�?1�m�@�EWIf@�P<�ķ�@�`��ZG�@�vV���t@��p��c@���8|@����ܬ@����u�@��ٯ�]@�6۔-w8@������@�x�/�;@��Qg��        ?�3�?�[��e?��\O�{?�̪�=[@�ɷU4@�5�\@��~-�@(�`;̥4@3��Nʘ.@=ւ&�U*@E۱B��r@O�!��l@U��*��@]f~s�@c��OZJ�@i��1���@p�՛��@u/�/`2U@z����j@���1K	�@�R�3ӷ@�����7�@�������@���?ͽ@��+l� @���p��@���X���@����M%�@�Jc����@�!K�Nb@�B��\�K@��UJg�+@�:L�E@�F���/i@��D?�c�@��Đ�@���e�~@�O��8/�@�Rb���@�E�BN#@���r\�@���+t/^@�ː�(�~@���A���@�z���@�m����@��D�M�@�BUHc�@Ң���t�@�����@՛����@�5Z�6@��E	�@ڣ�H��A@�y�0���@�d��"�@�2c1��@�=>d�6@�R���)x@�s�D�j�@䟠ꇱ@��� B��@�CIӢ�        ?�[m�ǀ=?��U�y>�@���8D@,U����@8��d�@CO%(7�@L:p���_@S�%ϻoR@Zᓪ��@a�=��"�@gO�޽X�@mޚ'JN�@r����@wY��9i@|��zᒊ@�>��쀞@���a!0@�[�Uy�@���r�g@��x�d��@�A�NM~@�,_L|@�j4#�)@�m|@�~B�,�@����đ@���Wذ@����^m�@�� "��@��2�7p�@���G�.@�u*�c�@�vtA��@��vY\r@��Wz��q@�wJ�  @�(���7@���1�
�@��`K�@÷*��%@�yw0v�J@�X�&�{�@�V�c�jj@�tK�p��@Ͳ��|[�@�	����@�LFx���@ҡ��K�b@�
v%�@Շ��@��@�E;�@�£C:�g@ځ�	��O@�W���@�Eݠ�T�@�&G��2�@�6I��!@�SY�XC@�}߭&��@�@f��r@��ڟ�+�@�R\D
�@�"��        @f�k=�@����5d�@��v���@ƾ(�	(@��{�ehu@��!��6�@����Z@�J�/S�@��f���@�sf��B�@���$nL�A �����A�-�Q�A"����A
ol�/A���:�A�OZ���A�!�L�A�~��A���Agf�iIoA�K�ŊAI=z�ӼA qdD��A!�Ё]ޝA#2&�}�A$�#=��	A&)߇/�5A'�o��ߘA)X��K�A+>����A,��2�i|A.��m���A0/<��A1!�C���A2��!�A3f��RA4"�qv�A51n��(�A6F�Ri�A7c|��A8���)��A9�x��ǮA:��l6��A<m/@_/A=Z��N��A>�:����A?�z��,GA@�G�͌�AAN����6AA�rާV�AB��h���ACj�Bo\cAD%�-n#�AD���T#IAE�V|AFj��T>�AG3f�<:�AG����3AH�5���AI��nkKAJ}`C3AKYٕއ�        ?�6;UL��?��!���@\�.��@ �b���@.�~J��D@8�L��z@A���fZ@H�"AÚ'@P0��_�@T�k���@YP��G�@^����~=@b$R�F,@e9�/99@h�°�%@l	����2@o��-�G@q�r����@s޼�{{@v1�K=@x:�v0�@z�o���@|��7ޖ@t��>�@�8>�@�`���V�@��#Һe9@�;,k�pj@��� u�@�Lgby@��<�9@�����@�L+mc�@�ŕ�gm@�r�RR�@�c.G�9M@�Z�i/j�@�Z�6��@�`�$�1@�o�����@���a��@�����W6@��*��^@���7m�g@�9��]��@�|a�$�@��A��[@����S�@�=����@���;B]@���߰�@�i�[�a�@�-�`���@��
p�)@��wt�_�@��Sz]��@�|��ş@�`;���#@�I��Tr@�9��d@�/yTl6�@�+h��@`@�-����        ?�/b��@��Ӭ�@,\Y3�n�@AJ�cIc�@P7=P,��@Z1Y?�ZW@cP�Av@j�v�@q�����l@wk�a���@}��u�ػ@�Ʋ���'@�F����5@��@��@�M��_�@�˙N;U�@��aj��@�P�_��$@�5����@���q�@�A��@��g��>@��<a�FM@�u2����@��7$Y@\@�LK�Lݱ@��_+�@���-Ҭ@��:�/@�>}D�b�@��F){�@��� �@��).�@�.;��@�{�A�@�@�������@�A����f@ѠhʑE@�z�v��@ԛį�܆@�:p�|@��M,�L�@ټ1n_�@ۡ�&i�@ݞ�]'?�@ߵ��2@��+�ML}@�{X�,@�J�3D@�@�|����@��R ���@�1uڥR9@��;FEh@��6�6E@�X&ɀ@� H����@���=@�4]y��J@����L@��n��C@��%B�v�@��j��G2@��R����        ?��K�$?�C��^?�M��?�ڄޅf�@
?���T6@8��)�@&�#��P@3��{�3�@@g�g�H@J=�����@TB�����@^J�@��@e�X|#�T@o��p\@uyt
Ӈp@}����@�Ax��)@�����@�"�f`Md@�s���z@���c:�@���I��@�oGgT��@��e����@�lj&��@��Hԅ�\@�%�#���@��쟺�@��,].@�@�4�f�_�@��$]�M�@ū�߮��@��{��ܔ@�w#��i�@�6��5o�@�g��(A@��|�e.@�xz�]nU@�`�P��
@ݎ�Ѭ��@���:Fð@�g=��@�t�[��8@�a��'�@��Hi4@�wT	�@�}�	_Hi@���T_S@�_���@�_w�<@����tN`@����iK@��k0�@�MbY\�@��Y�BD�A ���Ї�A�X���0Ac���)A���(A�;����A1=9hCA	��&���AݛD��        @n�"V&u@�؎��dg@��}�]@ؔ��>�@�F�x��@�����@�qRl�$jA�`%��A�=?��A�㇕�Aq�!���A6�6,��AJ3R��A����j�A!�η�yA$�v�<|A&�{� ]�A)jƝ@)A,?R$��A/1$��D�A1ʵH_UA2�+O�}A4X���V�A6
�[��A7����)A9�5˓�wA;x�x�A=f���yA?d��5�$A@�T�U>AA�XA�8�AB�Yk�PAC�f��fAE%��9W�AFU$�V��AG�2�Fc�AH�buW�AJ��O�aAKky�Q��AL�9ז�&AN1��W��AO���<��AP�: ��AQU��;��AR�g"�AR�1�{ASş��k4AT��}�ohAU��I� lAVn��k*�AW_~��q3AXW�����AYWY��.ZAZ^�Ý9A[m|�`��A\�����A]���mA^�Ze��iA_�o:�A`�����-Aa-bUQ�YAa�V�03 Abn�:Q(>        ?ʜH���?�t���@`���@*&җ$�&@7m����@Bi�%h6�@J��Ь��@R �Á�@W��E�T@]�][32@bcϚ�<u@f)1�L�@j@z���@n�
�`�@q�Z�6T9@t6��/m�@v��l@y�[S��@|�>/'@@�ˢ��@���k� @�LI��
.@�w���@��e��T~@���"C�@� ��h�|@�#S��f@�\+��p@����.��@��͢;W@�Gk��P@�����0S@��sҳ�b@�I��
@��c�Ƣ�@�/�c��m@��%	H@�F���$�@����ڛ@�GtK"�@�"�c��@�uɔV@���2�;@�սÌ��@�ƒJU}�@��#w\�d@��"�`?@��A���1@��9dc@t@���t�3@��;��@����+��@��n��`@�����@��R��@�����T@���k{4�@�7Ȑ��@���ꮤ@�bT8+7@��MK���@���^��6@�1`Wf�f        ?��]'�?��U1�pa@6�+�x@kcwv�b@+�CǑ@
@6&�p@@~G��-�@Gn�[�@P�,�@U��!5׸@\]� HP@ba�.�D@g�>�ӿl@m͸�L��@r�����@w;�鯗0@|��@#�#@��f�1%@�8�A�@��"�,`�@��D��`l@���F�%@�[��l�@�/�1<@�"�'��X@��{l��@�j�h�.@�9�ͯ`@�ODP~�@��  76@�(�S���@� <����@�=)����@��,����@��8�{�@�|��kj5@�8t��@��тw�t@��涖�@ûT�D0@�u2�n6@�H�q�B�@�6�G�\p@�A�k6�Q@�i��p��@ϰk�yy@��'̾@�O�i%`u@ӥ�$���@���AD	@ֈ����@��J7A=@ٻg�6u�@�u��}�@�E]�Fd@�-:���@���4��@�;�`�@⼗���@��>�@��g�@�X��V��@� �D��        ?Ӱ�L�@f��bf@ tbk�!@2	?
��9@@8F�;��@I��l��@R�ϒ��@Zq:ي"�@a�b�c�@g��Q�޹@n~�6G^@sc���
@xK�Wʌ�@~�ӣj<@�]n>��;@�3��Z��@���5��@�|��n,@��um��@���^U�@��.I��[@��|mˑ@�p��x/�@�����@�C��"��@�=�s-@�!��@��P.��@��uR@�)-�a@�ec�@��|�ګ�@�}��'G@�a,�][@�Abl�V@�����@������@żaTV�r@���d�B�@�؝Q�@�|����R@�
Kj�%�@��bq@�O]��X+@����a@�n�lC�2@��Eȅ�@��&�}��@�ț+��@�����e@����d@��}�;@�5kH!@��|��C|@��qe@�\-�@l�@��hb��@��u��@�w�£Q@����l@�9� @�E|݅��@���qʫ�        @���dh[D@�����p @κ+#�p�@��W��j@�s���@��?	<�A
�><�A�a09A���W�Aսk{5A�k�kJA�٨��PA c�^�A#;�j1A%���B#A)
�)���A,I'\���A/���SDIA1��aI-?A3��j*0A5��.'��A7�xd.A9���DOA;��i��YA>U�|5�A@b���sAA�[X	PIAB� x%}�ADQ�����AE�W���AG-<���AH�v��ўAJ:/7��hAKӑw۩ AMyƹ��AO,򓭗�APv����AQ]J���ARJ�����AS>k��AAT8ȟzAAU9��:1AV@�}�ZAWN"�l)xAXa�i'F4AY{��g��AZ�R�B#A[��[TA\�˹A^���ԧA_TT�:�WA`H��\�A`�l$sAa��_H�Ab1-�Pr�Ab�[���Ac�=2�4ZAd/��(Ad�i�d�VAe�M%�q?AfBSP�"cAf�opn Ag��L{�M        ?�h`�=�?�i�s�Gz@�.1T@��Ra-@&@j���x@1�w�m�@9��,�ڱ@Awg�d@F���~��@M�&�c@Q��m�M
@U�3��$@Yٽ�n�@^NO\�@a��0�zd@d#x�o@f��i$@i��I�
@m �B]@pK�m��@r(u@��@t(G+�F_@vM�]Y@x�`?x=w@{C��@}�3H@�:��B�@��O���&@�J�?%�@���$���@��'YE@���Ԝ@�����j@��\�9�W@�����h@���I�s�@��6!?�@�"i�B��@�{f$Z�H@��+~��@�c��t؍@���$��@���"y%@�S��&mp@�"�?J�P@�K߬�E@� j��@��Ȓ��@�}Z��@�8�wR#�@�b�ɣ&�@��ڶ��@��(���@�*�L�@��צ4��@���T�k�@�e���Y>@����rc�@�=��b^}@�r�J�5@��k@���}a@����P�        ?�~��:*?�:1H;i?�aƀ@Ǜ�y�@ώ����@+�Y'�~�@7`h�m+@B��T'"�@Ln���@T�����@^(�K}q{@e&@W��K@m��5@s�Zu��@y�	)VT�@����ӏ@�n����%@���&@�����@��⳧�m@� %>��@�??��$@@�
f`���@�W.��_8@��cd`�@�0��O@���W�@�n�I�w}@�8�����@�DqW���@����#4@�/��x�@�eJ�N.@���C@�X(��^�@ȻU-��@�FB2	];@��|��:@�j�`Z�@��eܒn`@ӄ�U��@�1^�Q�@���aҀ�@�ɟ;
4�@ڵK�9g@ܵӾ���@��_�f@�z[���@�U���@��[�x�0@��W�@�22���@�x����e@��#r��@�"��a{�@�7���u@��
AA@�hX�j��@��	 �r@�7\��Ê@���RK�N@��y��Y:@�,3�        ?{^���?��<-p��?�h`;�(�?�L����@Z����4@I��1@(��n�@6��[=@C.؈��@N���V�@W���@`��"�N�@gIy0�G@o�Z�$�z@tܣ��f@z��(�/z@�PZPۃ@�F�$5$�@�O�D�@�� �t��@��%��z�@�{]n� �@�s�L'@��̣���@���C�%m@���eǔk@��{	l�.@�i���@�˃Oy.�@�mIAV�?@���qT(�@���8pH@����A�@�}��"�@��%ö�@��8%��@§�
V�t@ć�17�@ƈ-���J@ȩ�[6��@�� o���@�U��wY|@���@�J�>�.�@ҷ���2�@�8�;��@�β�[�@�zԿiM@�;X��z@���@��+[t@�{͘|@��{�r��@�5�B�+@��b4@��֧.@�Fv�#��@�!ׇ�@��!_��@�Nt¦ �@�O@B�@�<R<Ha@��U�}�~        @d�-���
@�(��[h%@�����@�����#@���{�@�Ă�.��@�+�Z�$@���x�W@��RmS-@���e��A%�+eQAf@�e�A |Q��A�Zv�8{A�`EKR�A��.���AW���A�W�]A ����@A#���A%|�X�CA(
6�K&A*ʼ�v)�A-�(�}��A0x4�˔vA2-��bЖA4���AA5�3���A8m\p�cA:L��#$A<�b�zQ�A?6kF�A@�ip~AB]���5�AC�(ҟ�AEn7�E��AGh�SkAH�(Ϭ�AJ�3P�,�AL�h�AN���x_�APLx�AQc_'�%�AR���8�AS�M+���AT���O#AVF\a�CAW��}���AY�&�xAZ���-W�A\gy�A]��^���A_Z���A`�e�[Aas>��k�AbcT��qAc[y�/�Ad\7(v]	Aee�'�Afu�lK{+Ag�+�GAh�����Aiԓ�ud�        ?�V=����?���S�@����#@�� ]@%�76�S)@1�y̲@8�a��@@�$�-ք@E�Q���@K����@Q�D�H�@T�"�� �@XsW�<@\�19�}@`�gj�!t@c4-xb-@e�{9_@@h⮦v�@l��a��@oxNmO�@q�-�]�M@s��$d5@u�ՠ�8�@w��1��h@z$��)@B@|�<6@�!@D`�;֟@���HF@�|�[!2@��9?@��u^�S�@�Q��j��@�-Z�7@��0+�@��zn>�@��TWy	�@����v1
@�������@��c���@��H��@�N��M'@��T���@�Eu�b
@��U�@��B�s�@���An#�@�W�!�"\@�TƎbA@��b�<��@�����@��$�!��@��ǋ׽@�����,@�ʒ�@���C�l@��7� �@�k�`�@�:����R@�j��M�Y@��;��x@�������@�,��:F�@�?b�8P�        ?�f%��?�z�L��@��\j<�@$�P;JF�@3���]ь@@kٵ9u@H�<͈@Q��!pz@X�/?��@`�_��D@f-��l
[@m�˘��@r��W��@xI![!@~n��X�@��9l?@��e$ �@�+�E�@�Ƽ�޽�@�xcC���@���ʇ�h@���{A'�@�����t@����,@�i9���8@�,V1A��@�*<�R@�tOrJ͉@��9D���@��7��@��EJ�0d@�	g,�@��U��;@��{؇��@�ܩ@�[@�":�]�z@ɓ3��sw@�0A�*�@����V��@����lr�@҉T��e�@�0��_\�@��j���@�� ��@٬~��@۬Jb8�1@������B@���D=	@������@�Cz4���@�z�����@�>~�XL@��X��@�f$��@��@���@�At^�c�@��HM$�F@�SG���@���ɇ'@�P_~>O@�/���@�2��1^@�ڄX%�        ?��u<��P?��j�l_�?���É��@Vp���@"�����_@/����1�@9�m��
�@C�m��p@L�w�׃@T���]:@]t�r��@d@\��W@k5o��?�@qⱄ1��@w:�!0@}$�H9b@� s�q�@�7��r�@�⠘�@���ig�@�+���|@�h)N>+@�&�yT�s@�U�>9��@����O@�,�q@����Ś�@�+"��:G@���lX@��.�@������@�Kގ ��@��n?���@���#=;f@��ء֎�@��9�	�@�_q6�e�@�Uʔ��@�s�0�:@Ȼ:(�9�@�-�r(x�@��й�&�@�Mxs�k@�˒^cP@�b�uT@��i���@���U|U,@��_���@@��C-�@�ܵ<��@��b��@��SDG@��̪2@�7s���@�ܬ�w�@��%Y*��@�p�<о�@��GB�7�@�kT��+@�;�~��.@���z#��@����P�@�̲KǣO        @`��tl�@���Jc��@��1IN�?@�~��,�k@�w�ex@��IwyG@��N�7�@�(,��%�@�{NA�@�cn��LA�t.|�A�b��fA	f���A�j��snA!ѕ��A���L�YAYئh��AI����Aub���A�����pA!ċO�#A#�/c->A%ԟ�&ŪA(��QA*ti��u�A,���w}�A/�8���dA1@+��A2����M�A4Nٚ�1?A5����0A7�H��A9u�P�A;V��~A=L�w_A?Z�A_)A@���)�7AA���ُ3AC���aHADH�F6mAE��uwiSAF�&$|��AHK����AI���s��AK?X�ʨ$AL���7�LANj�[�-AP
�L|�(AP�锶�rAQ�cn�?AR��N"AS��W�{�AT��b��AU�5:�$GAV��x^0AW�l�4��AXΜ�m�vAY��
��A[7���A\D��A]|�,[�9A^�Ye���A`_O9i4        ?���I��,?�j�0I�@
����[@�S�I�@+�L3�E�@5�-�d�@?&>β4@E����@Kk�M�p�@QH�U/��@UE®UH�@Y�~��@^�N%��U@a�a(�<T@d���KȎ@g��b;E�@k���4�@n�^�j��@q'�<�'�@s"�\�2�@u;$p�<@wq��G�v@y�s�a�@|<�ǝ��@~���_0@��gj,�@�-�kV(g@���ɔ�@�1�8��@��W;$�@�vޯ=��@�2~K;j�@��,.z�z@��ZMRW@�̊�H�@�����\@��	p�@��4y��@� -���F@�F2/ �@�u�I�e�@��7�r�@��5*c�$@�?�v�uc@��H��eF@���0Y�-@�f����@��c��L@��y��Y�@�wA	��@�C�*�@���Sb�@��o `WL@�����K5@��/g���@����4v@��5�9��@�x��_�@�q�	$!^@�p)e�K@�t?�qs@�}�r�8�@���2[�        ?�)b>�K?ݦ��ȫ�?�VKT��@���v9u@z���@)�`�(@4����@?�1� >@F�&�8n�@PT����@V����x
@_�8�3M�@e�r%F@lşF'�@r�W1�.P@xz��Fô@?�w�^F@����"��@����Wy@�#��C��@�WXz{KW@���-L5@�b���@�:���@�V;���@�`R{#��@��*�ڊ0@�y�_��@�HW*c&@���7�k>@��4$lpF@��x]�@@�fH��|=@�qKQ�m@�Z �\7�@�y���@��Op�@��/C�>@��d2l�@�BR(�@̛���}_@������@�ُ|y@�9=� gV@Ӫ�A+_@�/<�z@���V�@�r�l�*�@�3�	�K�@�
p�}@���ƺ�@���m��@�
�� �Z@�$zE�@�I*__Td@�y��i.�@�f:t�S@��b�_�@�Q�`m<�@鰱��@��]M�@쐤ڠ�p@��&��        ?����^?�L�����@�,�H�}@#,���(u@2���]F@?�lpDV@H��.B_i@RK��de@Y�����@a�A��@hQ'\j��@p*k/���@u(K�T��@{L��U�5@�bqa��@��ܿU�@�:��ee@��a��m�@�u]�)S�@���T@����!@��p�o�@�Ǩ�mۺ@�V$1���@�N���@�[����@��c�)@�v`f{�@�a�I��x@���}�\[@��"��nE@�Z��e\�@�YC���@�|�F�g�@��E��@�6�)[@�����w@ϐ	���@�=Lud�@�Ǡi��@�gG�u�@���r�@����<"@��?��@��fR�6@�Џ�ó@��
iMp@���#mR@�En�r�8@�|>^�$@���I��@���"�s@�hę�@��V6�>@�@Lm~Zy@���&�@�GLs/s�@��_E�H@�>��L�@��1�@��h��^�@���Y��@�<���        @d��®@�a|�ѥ�@�n�*`Zp@�I����@�Ǽz��@�_��}@��5t	f@�/*���@�4�Ԝ@���gXA ��R�AR�* �AX�^HlA���I�BA�Kʷ%A��Cy�kAf���8kA��Ê2[A�dL��eA D�"�A"6�L��rA$K;�d%A&���o,�A(�]�fA+lV���A.�a�EkA0|1גA1�Ջ��5A3���˻A5Ka�o�A7�n[��A8�<-���A:��Qn�zA=�;�c�A?2j��ldA@�ı'�AA�a{��AC*00k��ADtR�@AEʨݳǫAG.37�<AH��Y���AJ�l2��AK��|�AMC?���zAN�e�!}APRR���AQ6˟�=AR!��:�(AS�וˀAT�^�kAU�[!E�AV�	��AW/��ᮺAXImW��@AYjEXR�AZ��VO�A[¡���A\��/Y�)A^8m��A_~��آA`f�ѐ�lAa΅J        ?�Y�$���?Ꚗ%��|@��l�b�@�D!܀@)���@5��"|@?{��@F
Cd�B�@Mt�E��U@R� �O@W�,�e�@]4�6װ@a�s��t@dڑ%
LH@hk[���@lIү�![@p<D�3�@r|nlLty@t��/�l�@w|QZ'@z=�92@}).��>^@�  T��@��WYޡ�@�u�f�@�=�h�Xy@��_�~@�
��@�t9`p@�(�p�@�XȢ��@���;��@� e�#8@�=�`�:�@����@��kL
@�H��1gO@��7���@�B�c2�P@��1y�@�|�Ɨ�=@�4@��G�@� ��<?@�mI�E�;@�eΓ>@�f7!�I=@�pٵ`G@���J@���� �@����]@��z}��@�6�}�Qm@�|��p(�@�̷Ҙ��@�'ͭ�1@����Yo@�}YS���@�9���qY@���c�k�@��)~D�@��xNO��@�]j�@Y�@�1���U        ?ƅ�{��?��+|,�@�Mzj�L@0J%ˣ+<@@���.�@K|!���_@Uc|B�E�@_TA,�@e��h���@m��%��@s�C�6@y�!up�@�p ���i@����{�@����7I�@�R0�j@��G�{r'@��`���D@�(��Tċ@�Q�s@�ٱ?6�_@����G@�~S��@�bұ�S�@�ء<7��@�7��"��@�����@��&���@��� ^u@�����@�T��S7@�B���F~@�S����@ǈ���u�@��P_8�@�b�d�@�	4S�>�@����_@�f���P@��}탠@՚;D�"�@�S�yy%�@�"�18�@��(ɟ@�G(���@�M}�h�@���l@��H�%@����~�@�? �B[v@���1X�@���U�@@�\����x@��P��=�@�j듋��@��z�U|@�m�o
@�BtHD�;@�/	~�@�%�
���@�&[���@�1��BZ@�H��$�        ?�9�-��o@�XK.�c@!¶&ρ@5�ر	�@D����X@Q2%���@Z���Q,@b��,&ۦ@i�ڿt��@q�R�h�@v%���_�@|.	H�R`@��/�R]@���d�3�@�[<��@���e;@��r��X�@�"UZu�@���O��(@��-�.>
@���t�ߟ@�OK�E(�@�Ԓ�?G@���;�@�y@��}�tē@����@���8ʛ@��#��e%@������&@�@(�q��@��A���f@�_^��%^@�����G@�"'p�]@�ä��T@Ł�?�a�@�]�)"Ir@�Y?�^?�@�u)3�J�@Ͳ���@�	�g`�@�K�ФC�@Ҡ
��J/@�4C�z@Ձ��hw@�����@زw���@�ilK�W@�6s\�~�@����@�
P�T��@����@�)Vv�(S@�K���q@�{/b�w@巠�lg@���i�@�Y�rt�[@���3.3@�4^X\�S@취�?0K@�J#"��        @yH�
���@���Ͻdc@�v��@�t~k��7@�(���:�@�d�x0+!A���LA
 �5k?A*(u�a�A�d�|�A�m��DA l���M>A#�k�6>A&�Q>ϋ�A*�Q��A.}���VA1U��F�A3�M���A5뇡��A8m�!4�jA;�h7��A=�K�^uA@m���|�AA��!���AC�]ܜ�AE\M�IVAG+kc�"�AIq`q��AK��F�AM_��E�AO4�V8��AP�=��LYAQ�?��AS��&�#AT?7D�PnAU�S��AVϳI^�AX'���AY��f��FAZ�Z�D�OA\c]��A]�)?���A_\#�1��A`qXO�OAa7�;��Ab�f��Abϣk"Ac�,Adv��m�yAePcJ�'�Af.P/Լ	Ag��~Ag�B��n{Ah�t��'Ai�Hm:~Aj������Ak�ta�SAl�*fX�Am���%�An�+EѬ�Aoڟ.��Apw.e��Aq���6        ?�mOx��<@�z����@# �5}��@502��?\@Cl����@NSچ�@U�[�Q@^(-(��@c���}�g@imIqY-�@o�%y��@sI�8�@w�ն�@{@���@��DL�@�N`bϔ�@���GVE@��Nj��;@�����b@����O,@��X@�lD`Dn@�P/4��8@�M3�ߨ}@�b���@����bVz@�ךω��@�7%��@�@������@�!_"&��@�x�R�l@�܆��uQ@�Okt�-@�у%��@�c��g�P@�)�C�@��3!���@�}!��P�@�(�;�@@��W>�@�pA��^@����s�@�(
%�@�<����B@�X���^@�{�n^�@�����l@�Ԗ�m�@�
<.U��@�F}�W@��Nq�1@���A�@�Ab���@��E���@�i���@��2��@��O�u@Ç~t��@�A�IF��@��TNXw�@��5�%@ƄtfoS@�L=
"�        ?�x����?���4@�j���@(�?�a�-@:��]��@I<w�1M@Uځ�VQ@a� �9"G@k"��@sʂ�}ev@{�(��l@��(L��:@�6�k�!�@�_�ğu�@�ܐ)o@<@�$v�O�@�$��9S�@��yc�@���b�v-@�V��y�@����=²@��E0�0r@��U���@�c�%��@�BZ�K@�<b�2��@Ä�9��@��f�%��@Ȟ�7�G�@�r�� �@�v@|�@��D�r
@҇��{�@�SrCq�@�7��@�4>F&�,@�KH�]�j@�|�k���@����;��@�����\@������@�/<`@�Jv��@�����@�c��B@����@��R�Da@�xMxO@�B�8e��@�$	�8n@��cJ@�
�I��@�'h�Mg@�-���o'@�N��_�Y@�zK���@��zP���@��d=�b@�=�AR@���VQ"@��)�oߊ@�as42� @��k #,^        ?�����[�?�=� �@k���'�@.�����w@?�2c>�@L��9'�@V�Ou�X�@a8�E/H�@h�(���@qp��,I@w���?s@��;�1@�����J@�(ջ۩�@�_����&@�&���f@�lC���@�2"tK�w@�=On�6�@�$Dت�@�O���@����hl�@�z�Fx@�@.�M�@�j!O��k@��r?'�@�@��jA@��\Ŵ�@��.�y�,@���G	ܶ@�C-���@�$8iG!$@�-���
@�`lf!�y@ʼ��� @�?���U@��/K�@�^d��s�@��v����@�i�exA@�^�zqh@��l}���@ً�d�?@�hha�(@�W�W���@�Y=aM��@�7nX,�@��Jr��@��s��@�G�H�@�-S��p%@�]&O8;@�\H I@�ϧ5d �@��Q�@�Yم�)8@����@���,��@�U�J�Ӣ@�[e�.�	@�>��@�Ƭ��^@���        @�=��m@��q�ő@�ӓ׍�@�bؚ��@�� ���A]�^{A��ܠ�A]'��PA�#KEw�A!R��VA%DE���A)�c��A.�_I�A2DyՏ�A5F���oA8�ި�A< ���	SA?��E=�-AA�8��p^AC��ʁ\�AF6JS�AH��[C��AK��
�AM�Njʍ�APF���AQ�L�$�ASMm����AT����cAV�>�t��AXq59��AZR��r��A\Jġ���A^Y�h�A`@4`,i�Aa_����Ab�⪧^Ac�l	�uAe�-��Afb�M���Ag��Q�|Ai9���Aj�o�"`AlH !hAm�Ż�(Ao���}�Ap��)4��Aq}�|<�/ArcO}TR'AsN��:At@:(��Au8C�g��Av6��﷚Aw<��6�_AxH�V�S8Ay\�@eAzu����A{��W�A|����A}�D�@An?G�A�(ڨZ�cA�ǎ�6S<A�i$e@?        ?���w*�?����	@K�v�@ނ�w3@"��0{�v@.�$,#�@5�?�-��@>HM�?@C�5�@@I4V.���@OI\�lP�@S�6�#@V��I�@Z����U@_Q=�ĺ�@b�<7�~@d��Z�@g��P�g5@j�	�a�e@m�vTo�@p�Fj��7@rwg�FL@tie��+@vw�[돼@x�7��0�@z顫J��@}N	6V��@Ϣ$> �@�7K2�o!@����#�@��\7t�@�~ȼ�3@�
A�)<@��^>�@O@�P}�^�4@� �XrP@��C5Pfw@���Ȥ��@������@��!Gg�$@�����@��,�E@�VA��@�+�4�{@�X��^�@���o"V�@��et�@�۬U�	@�j�	#4@�Ǌ>͑r@�-��O+�@�N�Gk�@�@�Y_�@��zo @��NX7o�@�\��Yt�@�+�%��b@���_�'@��|Ww<�@������@����p$A@�w���YO@�`� (:        ?�[A�>/?�,�r��?�o�*�:U@,��?F@B�W��@"��d���@/]})�@9P4����@C�ԹA��@M�(��@U��Jlk�@_	��@e�)I��@m.��o7@s[�`9j�@y/Vv>Y@��ڥ�h@�@�L��b@�![�ʹ9@���^h�@���:�u@�p��qK�@����� @��Z�S��@���`�@�����@��b���@��B�A@����Î@����ì@���30ݵ@�i#���@��|����@��#�f�a@�G�d@�E�o�@�nq����@��\?n��@�F�<�;�@��}�<��@��Z�}�@�}3[�@�$�y�V�@��틩W@����C;B@��	2��=@�ਲ਼GC@�zYĀ�@�v"�&Su@����Q�@�F)��s�@�mL@��i�@�Ǔp�@�ET�f|@�-&�B7@�fGb�,J@�!k�_�@��?_Rz@�bR�H�u@�Vi7唙@�RсT@�U^�<��        ?�=�G�*]?Î�H���?����9?� ,�C@	�83��@y��7�@%��T��L@2���5�w@>����@G�Q|-�@R��.�@ZA�d��@b����C�@iU8,!m�@p�P��U�@v,Q@|��*�@���6��C@���7�v^@�G��%:@�{�J��@��G�\f�@��8�M@�{!W\,X@�u ��U@��^���@�U��n@��q�"�@�݃L�9!@�w�^�v@�h����@��X:��@����r]�@��V3�{�@���
 �5@�Eh{���@����x��@�zJJ��@�%B�f�t@/D���@�*ɼt�@����7��@�v��@�o@�6��fm�@��}���@��#����@��ʿ�l{@�v�I�m�@х'��ԯ@ҝ�U>�@���~@����1��@�$01��@�fV�Q��@س6VP5@��s�\"@�o��AU@��(H�Y@�Zf�F�@�ሉ�d�@�N��@��V�@�_@]6B        @SZFe��@�YT����@����@�3�+�Q@��h�N��@�Y��@�@֟�x�@��,<�&�@��_�@�z1���8@�{�2o�@��c�Yq@���l��=@��4�2�@�<uX`ռA�� �A���/��Ai�y��A
h�و��A���\�)A��î�AJ�KA/��˞A-ξ1�HAE�bA�Aw0!�A�?z{A)ʜ��A �����A"%*��gA#���М�A$�9ԵA&lڑh`A'��i��A)���DʁA+DZ>~UA-��r��A.��9�u�A0]Ō��A1YYO��A2^=�Z�A3l����A4�3���A5�v4U �A6�w����A8qS��#A9D�묧A:�;XxF<A;�~��6�A=A�ѯ�5A>��l�T�A@�Aك�A@���Q�2AA���kABbjoi�AC3�<��AD	�0.ΜAD��u�cAE�1�	!AF��6�lAG����AH��bp�AIx<��x        ?�r�r�®@��i�U�@�)�@0���<@<��g5�@F�Ǻ�8�@P`��g�@Vi��y_J@]e��@b����@g�O�ò@lt7�|,@p�^�hl@s��,�h@v���W�/@zQ�f}�;@}�� 9W@��1(~@��Q��h|@�#��Z��@�g�S/Fv@���Yq@�FI���@��#���@���urU?@�=�%��L@������@�HP��A@�㍭͐�@������@�C�ܜ,@�ȸ�k@��A�K�=@����
�@���Y. q@��D Z�y@���NP?l@���J�I�@���cو@�j
؉	@�9�L�o�@�c�X�wW@��t�w`T@��)_\.�@�+����@�U�
��@����s:@��n��,@����1z�@�`2�r-@�b���@�ҝ]��!@���)��@�Uo[��@�(8N�@��0J�!�@����o��@��|*q=�@�g���@�E�`�o�@�(
LɤB@��^�^w@���%
��        ?����k* @�EF@!7c��D]@3��\cY"@A�Ě��@L1����@T�Н-z�@]Zr��l@d#���S@k# ��@r	�G\h@w�3��^@~�[�@��~�g;�@�
�:��@�]��X� @�g��h@��gZ!��@��[t�	�@�5��e�+@�u澼�@�%YI��@�SG)XV�@��¯Y4j@�2
��@�3��U@���]��@�^(�l�@������E@�%P��@ſ��{��@ȟy1OI�@��XԘ�@�BS֫�=@ч�)�@ӛ�k�@��)��[*@�US�ł�@� χ��@��9C�8|@����ћ@�.B���@��زq��@�����@��R�<g@�$nڕ*]@�ub|@��j���@�8��Q�@��A��j@�7,6�8@�
�A��@��(Q��@�Dg�.�@��	�(@��o��b@@���]�%�@����<��A ���e�A��I!A"���eA(y#v�AZkh�3r        ?�JO��>�@������@/�s޴@C��}%D�@STf�]�@`L�����@i�D��@r	j$�-@x�)v�[@��c����@��&�zTa@�vC c�@�,�Ō}h@�*�ed�j@�����@�K}R�>@���Ssz@��%=fd@�ťA��@��YB@@�w�"�@�*)�3K)@�(=��#@�wGR���@��)�w�@���4D@�@Ag6ݪ@ť_�1?@�A<B:yK@������@�(k�2�@мR��S!@҄�v��5@�m�u�@�wݗ��r@أ?�E��@��͍EF�@�]{b��@��K>��_@�N5��v@�8�=:�@�1���L@��A{|@�\uy��@�,v�^@��{�08@즜�J��@x\K@�E�AEN�@�M:4U�@�]�nV9�@�w^Bc@���{.��@��,�J"�@���l�ҁ@�7��bY�@�
��@�����A�@�*���@��-��N:@�������A ;(x��A �b=i�d        @�V,>��@�����@�+�.@�I�Pꤖ@�?��,?A�;'�d�A	�a)ˊ�A�쪊��Aa�"��{A�k_�EA"iP*gfA&W����A*��Q�+�A/`��u�?A2>�ng$VA4��7|gA7�U)��[A;�_9U�A>r���_A@�DL�AB܄�J�AD��Ǚ�AF�����7AI�<��$AKNk��AM���rAP�%�fPAQT3�X�AR�]���wAT�/��AUu�<��6AV�i[�`�AX{d�tR�AZ����A[�U�2��A]q�[5
�A_7�F�jA`���,�wAay|jI	�Abty���Acw�F��Ad��T���Ae����Af�Ě�"�Ag�}b��Ai:���AjF##�'
Ak�a�A\8Al��_w�An)`�R��Ao�I4�<Apxq�*��Aq1�?[�eAq��CMAr����lAsz�o��)AtH)Ƭ��Au�����Au����Av�Ď�$Aw�����7Ax��q�hIAy�_|�M�        ?Ԥ���e�@l���@"@q�C6@4s
�y[@BVXL���@L�,�  [@T�c5��@\�F�`Q@b1���@f���	@k��~�@p�-��L�@s�Ӌƻ@v��|&�@zO�="@}��r�8K@����n�@� ��k�b@�0Fs{F�@�}X�g��@��߷>�@�l4{��z@���<@�䘛��@�PD� �p@��\M!�@�O�a�O@���O��@��|��@�1Iz
l@���` �@���S��@��j7��:@����<��@���-�@����q�c@����k�-@��v���@�	�p�1�@�5a���@�k%k�=@��%����@������@�Kh*�^�@����H{@��k~�@�I�}8�T@�e\���@������@��X��@��n�b@�cT�@�@�LNI��@�=��6�@�7x����@�:���@�E��夸@�Y�ߏ��@�wW�I�@��!l�=@�Δ�_��@���M/@�&	O�8g        ?�
��C��@	��rG�@@.��4/w@D��4�T@T����z@ax����n@juIt�$@r����{�@y�qh~@�F\�ޱD@���N(�@���~(`@�p��k�@�����E@���Y���@��C���@�(;���\@����o(@��-}x@��r�VN�@����$�@�� ��y@�>QP�]s@�qI��@���4P@���hH�W@����(@�Յou��@�9(6�@�4简�R@�aP����@����*}I@�Y���@�-�;�,@� �<:��@��N��% @Ӝh-�r@Ւ���iD@ױ��0t@��<�;R@�p���Z�@�	k�d@��Tj,�@�vL5- @��)�"8@�ʲ��@�iep��@� ۿ֩@�HW-��@���D+@�
��t�7@�@��eC@�D�@���N	�z@�C���#@������@�D�%il@��Y���T@��S��H�@�A�r��@���,A s�W1SAi����'        ?�/�x}@���N0@0l����@B׻�˞@O�v��j�@X�C�%I{@a��4�M}@h� ���@pI���	@u>.E�6@{g4K⍰@��g߿�@�T�ď�i@�A�\U�@��{M��@�+��5@�x�ϵC<@����#u @��؉�қ@���
�@����J@��U���@�/���@��{`�(e@�"н�K�@��2���@Í�8{r�@�wS�p��@ɭ�k|�@�4�,Y�@Ј���@Ҡ�4��@��?�W%�@�Xޡ+@��h�_�@��V�Y�@��	Bt��@�ynB>ka@�'���m@����FY�@���]��b@�. wV@�Ѥ^�@����% R@�:���R2@��m���=@�h���@�KS�*b@��G�N��@� T�/��@�n�.z��@��Ҟ���@�rF_��@��ŝ;@���r�8@�Z��k0�A �rR��Aq��_A]��A�APݴ��kAJ���	AK�L;ASu�UQd        @�J�8 ��@ń{{��@���F,�@�	���/*A�@�9�A�(m0A��O�/Azk��A!�����yA%�ᙤ�#A*X׀�`A/JW���A2L�tm�A5#[/���A8(��!%�A;\�H�A>��D5��AA*���AC��@a�AE�� [�AG�V��1AI?���V�AK�� ��AM�6r�wAP$�Q&��AQh�;���AR��"�;ATq�Sj�AUx'��SkAV�y�s\AXe'U���AY�ʄ�p&A[�5�p�]A]��|�A^�M��A`B�G��-Aa&R��m�Ab�uS�BAc��]�4Ac�+6�p�Ad�(M'�ZAf���Ag!;��Ah0�g��AiR�,϶LAj}�'B�fAk����AlsTEAn6�|7��Ao��:��Apq]1e�'Aq$0}�u�Aq�c��$Ar�[��PAs]z�ŪAt&��e��At��k6��Au�Z��Av�(e&W�Aw���M*Axr�3�t�Ayc9}(sAzZ��$        ?� :�A�?�!��~?0@���1�@+�u��@8��Š&@C}���P�@L4���?B@S=(q�÷@Y#�22�@_ʦ�)z@c��B#�@g�J�n�_@l7�k��@p�mQ�@s?gl�J@v#�6L�@yA��Kw�@|��&[b@� ���@�f�d@�(]�5@�i.Ў$@��'���@�j�M&-@�+ݡ��^@�����Z�@�;�3:@�����{$@�w�ԅ�c@�G���*@�.�F)J�@�,����@�@���&�@�lD �7@���WO+@�DD�O�@�;�z�@�~ILL�E@���䝅@�&͎��m@��ּ�@����'��@�w#imɯ@��|I��Z@��	�rs@��Cf��@���B-ǿ@��q��6b@���e��@��C:��@�q���#I@�ab�"��@�V��?��@�RV�J��@�S��
�R@�Z��ܠ�@�h4w�?@�{�L�2�@���ޠk@��ՖE9@�����|�@����K�@���Jd�        ?�e� ��2?�(���?�(:�N3�@.�K��@  ���7@*�G·�@4r#8p��@>2��*/@E�.���@N�7��x@U5-�m7@\�;��@cp��K@i���U�F@p��[uA^@u�fR��@{TD.v}�@���D@�+Uit�@��o�$@�^�Mz8@���%�@�\'%9�@�Z�uW�@��R��d8@���q��:@���%#ҧ@��PE�xm@��>4@��	�~@�Bw���@�cJ��Q2@�����n@�+�S"�@��06Cz@��f{ �@�a��I@��\�@��8Q[�O@ŝxd�<�@ǖo2��Z@ɭ�;���@���<x�@�<�$�@�ZC��@Ѧ��bu@�f���@�t��<@���ه̚@׋�;�@�2f�v�	@��Q�j�@ܻ}\L�@ޞ ��Y&@�J�l���@�P�3��	@�a���@�}Ws&?F@�+�Xv@��RwG@���(@�]��%�i@�	��fa        ?��J�Bu@��3ԅ@F�^�,�@/^�FV@:+���fK@D*q�B@N&��N��@VL2z%mM@``u����@gի��˕@q��J��@x:c�%l�@��k�K@�����@��Qko'@����Kk�@��3x�Z@�7\7��@��t��3
@���ڣ�@���MC�-@�,Ge'(K@��`�
t@�z���,@��(���}@�9	�nUJ@��e�D�@�6�)>@�:�B��@ϩӺA(�@Ѭ<��d�@ӥ�Am�V@��Za�"I@��s���@ځ�.� �@�#o�da�@���}��@�{|�e�@@��F�@�ǂ��j@撥)�N3@�vm�.0@�r�f�[`@쇄(}c@�msj@�}'|U�@�$ȕ�@��D��Ry@�.hi�"�@��l���@��0�*�B@�J�)F�@��L~8{@�A����@��공O>@�d���jA ?�`�A آ?c�A��uR3A�[�g0Av/��*�A^q�[a9AJ�t��        @|���<ζ@���, u@ɹ��}�@��&G��@�*�3��O@�b��*�@��wa_R�A�"]��A�wu��JA
��Gk�ASKgt/Ac
3fA�rC��A5g����A��p�<-A ����l�A#uѢ�A%V�ṅA'��<9�iA*:d���"A,�ʳ	�A/����A1[��XO�A2�u��{A4����E]A6Z�J��A80�L+�*A:Y��uA<�P��A>4�ٙIA@0�T��$AAQ��%��AB}�B�]�AC�ď���AD�%�ko�AFD�f}�#AG���BAI�EWc;AJr6Lu�8AK���\��AMq�PB�rAOn�|��APMm��AQ �[�AQ�_���OARЃ���IAS�r�YAT�=�N�^AU G�AVm��P�AWb�WAX[�^Mj�AY[C��lAZ`�S��A[l%ޮ�	A\}��_UAA]�[l�kA^�L��w�A_��M�EA`���< �Aa=�sjAa�y�R�EAbZ6��b�        ?�3Q(�?�\�@9�5��@!殫d�H@/��U*��@8���(@A�TU�+n@H��'�5;@PW�tp@T�Js��@Y�$G�
<@_�y�Q@b��^��@f'���@i�2dC~@n��Ռ@q9�o���@s�����@vż���@x��g
B@{��t�d�@~l��6��@���%�|)@�Du�ú�@��<�j��@���G8��@�MYzo$&@��l C2@��Sq��@��؏R�@���^��4@�~��D�@���f�@��U3��@��HUyV�@��~����@����-@�BS�g��@�wVX,H�@��F�>��@��f*��@�2_��QF@�x���@��>v[�@�^�F\�@���>�}y@�[v�>WU@���x�@����τ@�g��%�x@����i�@�҆}�3@���L��@�J��@�%��I@������@��Ek<*I@�d[n�:@�4"\C�@�s�yx@��I��&�@��rm\Y�@�������        ?�pt��i?�7�`��?�D�x��G@ ���c@%K�ź�@2``Ɵ�u@<�e\K�C@Ek'���n@N��n_k@U}�X
k�@]��(}[�@d���J@j�e��@q�C'��e@v�hZѥ@}}�a݇@����43�@���ӛ��@�4��=@��EA�\@��D~�@�:w&Ç%@�C��H_@�w�f�@�������@�#��T+@� :5�2�@����e�@��c��@�i��zI+@���)�@���N;�@�7)��]@��Ҟ[:�@¨H��(�@Ĥ0�wE@����Y\2@�ЕR��@ˊvT��@�0E�+Z@ЃK���B@��(3	�@Ӧ�؂�@�`��:�@�7+�V�;@�*r"�RS@�;|��C�@�kj;՘@߹� %@�er��
@�\?O�e@�/@��z���@暘�l	@�(o1�@��� �@�|�iF!@�B���|@��¯�9@�������@�BS �@�eχg@���U|�        ?�V�=9�@b���r@ �9&\@4T�4Q�b@C���;��@P�ɓ��c@Z����@c%`�[�@j��*I�@rAiU���@xe|"�@u�-�@���9���@�u�#��z@���1q@�vq��@�����ݥ@����"Q]@���:��@�D��d*�@�Փ`�Y+@��
\_�@���5��p@��R�z@�,�1�[�@��}/@�Y}MJ@�2u�GL@���*�@��X\ƈO@��xb<%�@�7x�u��@��'����@�V�1��R@��=n@��=q,@���,�@��� &�n@��4�9�@�j��'T�@��6�8�@�=S�/g@ӝ^ܹAN@����}@֘��V@�52q��@�旄��@ۭ#���R@݈�W^�@�y�#�F�@��:5@��d�~�@��@ô1[@��X�;T@�-�	hqM@�a8{!�@�w7��c@��g�^��@�/����Q@�~��-�@��W��`y@�IG��)"@�KΌ��        @w0�X�܆@��ѳ�%@����z@��(	p�@�At9�@���5§�@��dZ��A�9/�A�V�_�XA�H�DA�tK�ZA����A����]<A���zA"Sn&��kA$���xuA'�7d*��A*��r%�A-�;g<IA0^���A1� �r�0A3���E�A5N�|��A7P\KhA8�n�2�UA:��̡��A<N���A>d+qq4�A@)����AA$ZH:�AB#�ݻ\AC'XU��AD.�-Z �AE9�v��$AFHw�2QAGZ�68{�AHp��XAI��!�[kAJ�<ʾ�AK��/1-AL�h6h�ANuS�;�AO:2��� AP4Mt��BAP�T�XcAQh,�x�[AR�5��AR�l� 	WASC��S@AS�t�=��AT�xw��AU1�x���AU�sQ�AV������AW4�Y��AW����AX�ݾ"�AYM����AZ�>��.AZ��
g�A[~��
A\?�m��A]?h쭩        ?��ބ�<�?�N���x@
���B.b@�=�箓@*�;5J@5d��ɪ@?N�5\��@E���`�@L�%�t;@Rc��XO�@V�~`��@\'�VY�@`��&�@d(�8�@gs�s�aS@k!u뇦@o���Q�@q��⑳@s�����E@vQ���`@x��8�@{�Zh�i$@~]�*�S�@���B��r@�8�.f��@��,MC.D@������/@�J�.N��@��� ��@����#@��I�a��@��Ik1v�@�}��9�@���ee�@����a9@����6@��v��@��Z��@�G2���@��YU/ܳ@���W��{@����d@�[���@��:���U@��ʡ@�:z�;� @��z�b�@����/�@�l�W��@�0��N@��(6L�C@��d�/v@�����/�@�pi?@�M�3�V@�1�]���@�;S�DT@�u|�:@�	7�{"�@�|l���@�E�(-�@�6eu^r�@�\K�v�        ?�(���?�6�?�!���i@�]���W@*���@"����@0v� :�9@;jT{S��@Fe�C$�@Q5ϲš@Z)_��"@cC^M�w�@k���6�@si���(�@z��3�9@��'��)@�v"��+H@�R��%��@�I/t^ٻ@�.4��E@��h}S�@�I��1l@��FΡ�@�su�y��@�XX��@�g�%��g@�o�X"�@��譠D1@�j��O~X@�/��Hoq@�QL�@�t@Ě��4�@�$�ץ�@ɢ�/3@�a���V&@�G�~@�*gl���@������@�t2�I�@�8y��"d@�Ï!�|@���@�z	1��@�0�[v�@�6~�7��@�b��@��@����@�=N��@�Fg.��@��y�z,@����^�@�6�r��r@����ap@]I��@�,)h>��@�����@�	�Rrb@��iْ@��2��L@�_@�7�@�%>���@�@#

_�        ?ƿ;�9Rt?��kR��@���/��@%*n_(��@2��o��@=�K��o@E�����@Oi�@R.B@V�r1@^h`3'�'@dƉ����@lB5�@r�3�a1@x�Ƨ'@�c@LԱ`@�@����@�=WrH��@�?�4<S}@��5ܯ[�@��J�)��@�W��K�.@�̂�n�M@����f@�B:���l@��'ѝ�@��|���@��}�[t@�+���@�T���@�է���@�]F����@��N�7��@�kR�9*�@�3X��`�@�%�~@П��{�@�@�Xq@��6�0U@շ�	Q��@׍��!�a@�s����@�i�SFT�@�n<�ʞ@߀�m+�@���P��@��fv�ئ@�ʜ8i�@�,"؟��@�X{B�u�@��]8�@�Ơ�GPk@��kQ!r@�R�O�h@�|V�@���3��@�_Fɵ_�@��XKÚ�@����@�\.$��>@�u�f�@��/�>>@�)c�d�@��סE        @j>�]��@�y�X��@���2l�@��H�ա@ۨDZM�@�vN�sI@�/1��#o@�/_O�k@��)&��At�J�GA��3�gpA
�ՈA��YKWAys[�A��^+A���YA/z|Z?�A�9f'.A!]�A`A#	,ě�#A%WԡD$A'1��6��A)o���<AA+�qWTc�A.@R$�G�A0hlV�2A1��^�vA3f�hbA4�r���UA6m�Q�
A7���^*A9l��tmA:�����TA<e�uA>0K�A?�n@pPA@��C��NAAĻN��AB���;AC��A��XAD��~i�PAE��iy��AF��7p��AG�g����AH����AI����?AJӳ/7��AK����`AM�� ��AN:+��kyAOj�0�2�APQ����AP�I����AQ��gP�AR;F�H��AR�m�A�AS� �͋�ATD����hAT��lv��AU��@���AVwN��JAW?���عAXr��f        ?�9��n�?���.�el@�o�+��@$c�K��@2��G�H@<'��T�0@DS�ߊ
:@K�r���@R.ޗ�@Wj.��i@\����@aW�͜@d�{FI}�@hZta|о@lS��@pN6�C�@r��*M��@u��k�@w��46D@z�s��-�@}}0�@y@�Qs��4i@��Բ�d@����q�@���/[}N@��9�Mo�@��E�(0R@��K���P@����_0@��"A��@�S�b]��@����l��@���?/�@�Gk	��@��oI��@�-Q�Ds�@��p"�e@�L1z�@�����E@��V ��@�6LvY��@�!��@�9���@��+2`@�d�V�@�!'��gI@�7~�D;@�V,1M�x@�~wj�	@��&U�#@��Wi�D@�0ܢ:&@�~X1��@���a�E@������@�М�N��@��H+8�@�H��h@�H[@�Ҟ�P�@���:s�K@�n�kmK@�D�*��        ?�Ȣ�x��?��cUAn@܆�#$�@.%S�P:@<.�C�@G1/��٣@Q�V-H�k@YjG��ϓ@a�R��@g�S�ٌ@o�����@t�{�@z�1�yp@����� @�q�vn�4@���%��@����:��@�=8I0`�@���}��|@����'@����g @��5��)@���3c@��1�ݠ@���(�@�?�#W@��ȣL�@�΋ �@���u@��4���@��ǝf��@�Ėp�
�@��ڙY�@�T�~eV�@��OK� �@͊U�?��@�3A�(X@Ѹ5��x�@�T�7�G@�
:�g]@��E��3-@��:�;�@���7�A�@��Oi�k@�,�5�9@�ƴr�>@�QK�@�X�o#:�@��.���@�1 y`f@��ʧ;�@�S��D�q@���3Ė@��N�k�@�]�{b@�CԨ.�@�D�9��@�Q5��f@�i�7@�FR@��l��@����@�?�tᵭ        ?���CB4?��R 0�@>j;��@)Qz�Ao@:<Z�:X4@G�%�7H@S^��j:@]��Ԇ�+@f@�Ʃ�@p w����@vm_h�?@~�<���@��%e��v@�A�:�m@��6��5g@���ɽ��@�[��$M�@��Ȥ)�^@�{&��@���pg�y@��$��u�@�MEG(@�mؒ��^@��ٍ�@����:�@�i����N@«�B��@��OV@��"%;�@ʟ���@Ͱ�"/�S@�|�g��D@�>D\k�`@�����@�ް�/�@�9Ϊ{�@�x=��,1@���[Vl�@�X��$�@��Ƀ1�@�`o�ŭv@�Ӣ���r@�Wc�D@��h�]�N@�a��13@�C8��$@�LkG�@��g_+5@ﻭDd�#@��(��
@�ؿ�R�@���b��@����=l@�����4@�7�8@�e���I@���� @����,�@�.����@��_���@����9�@�U��4� A f�#̣S        @y�&lX`|@��
��Ž@�G{�ݛ	@�~��a�J@�d�M@�!w#�n@�2Q7X��A �*�;ڕA�՘�CAȊ��8A=Ò.�@A�W�[��A�h�m�A��QV�A!Q.fŞ�A$	��>�{A&��
WT�A*6�Fb\vA-�-=�i�A0��먷dA2�e��;sA4�(EzΣA7LP���\A9�"���*A<��~S߃A?ndq�Y3AAB��qAB�?�9�AD��R�^�AFz��EAHh�6�sMAJo.�½uAL��p}AN�;�x2�AP�K����AQ�4So�jASyh1�AT\�����AU�Q}M��AW3�r�gAX�Θa�_AZI����qA[��qNLiA]�7<F�A_][|rD�A`���d'�Aa�L��p�Abye��aAcuŗ�Adv�S��EAe~� �!�Af��.�d�Ag�=�8X�Ah�p�
��Ai�R�q�(Aj��N�#�Al'O��O�AmW�HblAn�z��Ao�����Ap�澗'0Aq(L��Aq��B�k        ?�9����J?�N7%�@x`�p�@ H�嚊�@,\cR@5�g�|T�@>֕�1H @D�+��˜@KL'i��'@QM���o�@Un�v0@ZK:�k@_)�%��@bd��o�@ew�9m9@h���Z8�@lkVo�S@p&�2Y�@r: m�@tp9'�^u@vɑslze@yF��!��@{�7+�?@~�5Wܳ\@����&}@�Yo�-��@��L��FR@�����\@�l�yُ�@�D-pQx+@�.)d���@�*��)�K@�9���@�����A@��A���@��o;��@�
1�:�@�A���@�{�1?��@������7@��|L��@�Vɏ}z@��bKF4@���'j@�t�[A6-@����bZ@��u#@�nb�%8@�3>'%ǒ@���J��n@��O����@��b�/�]@�r���6�@�M3oΖ�@�+���@@�~:��@��L����@���~�a@��wz�U]@��2i��@��-$x��@��D5aw�@��[���        ?�G�(xx@��'v@1qQs�m@CZg5���@Q��]�?@]�Q�ؿ@f�����@q%�7�@x���Θ�@�_t
�z�@��A	�+�@�������@��'S��e@�����]�@���E'u@���]	�@�o*jE�@��5�i�@�=���l�@�xY�"	�@�[�6��@����?)+@��� MS�@�Ԗc�պ@�K��ey�@��s�W@��Xn�g�@��P	;�@Н�1;:>@�f���x@�Q�{�@�`���VQ@ؕ���@��3IO�@�vⓜ�V@��u?��@�>��@�E{h �@䦵rTH3@�^��\<@�0��@���)rY@�)@�t��@�Q@�֪@�K����L@�~���@��^C+ً@��|֌@�t�G��@���r��@�j���JW@����!�M@��u���A@�UM�A�@�E6�4&A v� ���Ah��Ձ�Ab�>�hAd���Ao'��v�A��S�v�A���H�A��r��]        ?����!~?�e��@Y?���G-��@ ��t#"@�t2W@"�#sjq@1ś����@?�Oo��@K+$D@Ve�{@a��#�>@i{*���@rP62Cg@yx7���=@�2S�2��@����ux�@��x`��@�N8#��@��Lz���@��,_�� @���j�c�@�� [��)@�2vT�@��b�G@�^�S9�&@�ZPi��@���!K��@������@��藵��@�+:@m��@���K�P�@��c˭�@�>I���@Ǧ'X�a@�?��w�@�
��@��@�� Sw @ѡj�.�@�XW��@�,+��d@��ݵ��@�+ �%vs@�V��9=@ݠ}����@�u?#�@�Hac� �@✁׷�/@�n�?��@�w��⼤@� t����@�m@�@�Kp(h�@�N��ː@��X�<^@���0@���耯@���Ax@�5H�^@�:1�Y�@�j��8_@��ƚk�@�����@�E����        @|��l^�=@��i�*�@Ð�bվ�@��_��@�|\r�	@�4��L �@�\
��@��*�
9�A��@c�A
xT��A��ے�A�4��A�u_�Aв(=Q�A"Y�ì`%A%�a�I�$A)�f|;�A,��6� /A0pN$M��A2�E�[��A4�3h^:A7/<�\�0A9���ԍ�A<>�L7-A>�L�y�A@��"��VABU_D~�AC؇�)sAEi'-�ltAG����AH��K>�AJi�����AL-��AM�� AO�1d���AP��İ AQ�h���ARِ0�v}AS�l}��AT��d�AU����AW�[��AX,R��{AYN��j�eAZw�d~|A[����A\��5��A^Z��^�A_\Rޕ�A`Rڿ�?TA`��s�.�Aa�r�ggAAbS�weAcc̴�Ac�1��C7AdkO]� wAe"��/Ae��z��Af��D�IAgT&Fz�=Ah�g��Ah���4*Ai�ZTBb	        ?��E~��?�+'i�6t?�1�hMm�@�n��@Z�Ȏ��@(&ڃ�q@2(���Gp@9�h�ZJ�@ANP���@F����O�@L���*j@Q�۴��@U���@ZVV��@^���!2�@b1�
)�@e#��&��@hUE�f��@k��X�_@oy�1�}@q���b�@s��m�@v4l�Ɣ@xy���Ko@{�,&�@}�����@�B�vyJ�@���ߥ@�M�|�t@��x2A�@���`�AT@�f��ӆl@�=����@�&>I�@� uT��@���O�A@�&䣗xH@�A%��@�e�.�>@��wF��@��A�[��@���dwr@�[�\�@��EA��@��Q�e@�qZ�Ţ�@�߷Wy��@�Weؙ8J@�lM���X@�1��˯@�����[@����=(�@���T�@�w��1��@�U�=H�9@�9
�'s�@�"�w$@�)|;@�}աx@�c�W�@�2�GQ�@�CM�A�@� ���        ?�3�ٶ��?��Y%W�?���u�@ ���@ �#���@-4�@(�@7�C}|'@B������@LD� �*@T�T���@]�&����@e	ٟ���@l�!|7d@so��@y��'��@����u՞@�!���@�� V�&}@�v���@�0�47�@�����O@�w�~W��@���sP,@�Õ�tƈ@�\���`#@�_��@�h�&_F@�ڋ���`@��G(�^@�mˎ�@���Xp�@�� s$;�@�F#H@�3�ۡ�@�Aɪ�@�p V3�@ɿG���S@�0���@��˛t�@л��BLh@�'q���@ӣMD��@�0�|,5@���3��@�
��L@�A��XC'@�Wp�� @�1-�`@�����>�@�
-���@�[\1jR@�@�)oS@�l�����@�E����@��Ŋ"k@�<�N�i@霐�q�d@�
)���@���@��Na�@��#�r�@�E��!m@�K#�f        ?�����i?�0��cU�?�c�6;�d@� >�@ 2�ђN@-���U5@8��j�@D���V@N�0~�0>@WH��?@`�D@�ˣ@h#�6�Β@p�����@v��_�pN@}�P��?@�_M{�@��
�@��q�f@�B��>@���dZN@��1c�@�#��E�k@�]wmy�@���~.�@�nE��J@�>#y͠�@��e�@�Q@�aT���@�L�th�@�v�ˬ}�@����6!�@�Fm���@�>�ji�*@�Z���O@Ǜ��1�3@�u�A�@̖r��O�@�Tj+X�@� ��'o@ү�xqm�@�Y9��@��6�N@�Cw4z@���}�"@�#��OX
@�fV�a�~@�e�嚱�@��ER�&@� �b�R�@�i��/�X@���i�YT@�wfb��,@�
@��ë�n@�yg}�@�}0��>@�=�-��@�C..�"@�S �@�mJ��|�@���e���@��m�A�@��X<C~&        @WX]Y��d@���c�}�@��c[w�@�B��=�@�E4���@�1B���@�~��Κ@�����_�@��1cwaj@�тh�*@����d�&A���)e�A���:A�t�A&���A����;AA�Ԧ�A���� &AE�4g�A!՘s�A#3L�(A%*cS`l�A'\D�>�A)����A+��т&A.p1a/oA0zU�W4�A1ƨG�dA34�4ݣA4~2��s5A5��ֆ;A7`�b۽&A8��vS�A:pp�.�A<
��rz�A=���LX�A?fs
Ca�A@��؝�AA~���ABo�*0�ACh�z~jADh�UC��AEr'm'AF�V�W�oAG�ꃽ&�AH� �ߜ�AI���AK��?;ALZ��9�AM�q�ǹ�AN�^�}SAP%UO���AP֢NfAQ��e?mUARG!Bw��ASUr���AS�:���TAT��9�4AU`q=�.�AV3 �b�lAW
�c��AW����l�AX��U�        ?�G�+~��?�=�mgJg?��Qw�O�@f]j��@њy&~�@)O�p���@2r����@9Vt��4@@��g�	@EB����@JrF
5�r@PFy_��@SS\��@V�6Eԩ�@Z��}���@^����2@a�߆|}�@c���lc@ffnW�w�@iԪR@k���(�@nǤ=� �@p�j��D@r���Z@�@tA�>+z@v	�8��J@w���27�@y�.`xe@{�rޚG@}��H3�@����@�8��9�@�hnf��@��現�y@����<��@�C9vw�@��ɴ���@��G�@���/�pu@�-���@�ͣl�@�}(�V��@��O�;�{@��I��{@�v�f��@�pE�@�r8��y@�}g�W�@���N�*�@���:
�
@��I~X/�@���!�@�=ࡩ��@���A%c@��]�P	@�$i=�a�@�C�֯�@��X����@��bM�M�@�wb̛��@�?��z�@�:7]#@���^��        ?r��Q�W?�E�S�yA?ԟ@���`?����'2@ov\�u�@I(G$�@"�7Λ3@0�vG>T�@<]K ��@F�{�x�@Q�AKQO@Z�c^'@b����
3@i��X7@q���=@vMmt�Ū@|�}���@��q��4@�A
�T.�@�D�lKk@��89�m@�ڤa��O@����?�@��@H㴜@�_!6���@�����@�aWq7@�f)�vC�@��iO�@�����e@��^��da@�&cߖ�@��x�a��@��`z0W@���J��@�k�>K�@�(��m�@����!@����J�4@��u��l@�AF4/��@̏J�'6�@���u�=@о����@��;��@�kX��ȃ@��.��{@�L�-�@����T�@�a[Spr<@� B4[�d@ܭd<�@�hh��@�Ut��B@�B�AN�@��S��x@���Y��@��N�sH�@�����@�(z�@�KI�%@�x*�.�_@鯖�в�        ?�R��3�b?�w����@�UȞ��@�m�@*��R史@8��[�R�@D�De��7@P1�5��=@X�W���@a�f��
�@i���7�@q����Y�@x?�d��@�3Wq2@�?���+@�d�-H@�_�;.a@�����P@��jk��@�=r�|P@�~�>��"@�${�G}B@�0��-P@���d�B@�@^a��@�ଞ9 @����>a�@��S)�c?@��;n`�@��T�v�Y@�ua0@
=@�W���g`@�P�io�,@�`;֖a@ʅly^�@��D��j�@�ȿ�"�@л��D��@���iΙ�@�C���@ԙH�!��@��!�/q�@�iş��@���?�$@�o��j@����H�@ݯ6��ϯ@�e���b@��W?Zq@����o@�uv.���@�q`]V��@�u��B\@���/?@斮��@糪����@������@���"�@�<��]�Q@�{t��@�¼��3;@�����F@�5�����        @V������@��6��8@�7Ƃr9c@��m>�b@ΣX��kA@؃�d���@��%�%@�õ��cj@�Z)xz��@��_=�T@� �n�Ŧ@��QŠ�A������AW�4�;A	�7�ONA�ܠ-`A��d��A,q��CAs�i��	Aԝ�^<�AL�.Ҕ�A�*��xA��� A!@���DA"�0:�aA#��c�3A%�M0T��A'�*�yA(�����A*N�zd\A,��A-�I��A/�^����A0��yn�A1�g�6A2�96��A3����VA4�U���A5�A��A7p����A8/O-��fA9a�FA:�t}<�A;�OzJ�HA=#x�q4�A>r� �AA?��AܬA@�j���AAD¡7�JAA������AB�r���)AClP���sAD*H�C|AD�r�AE�:N�G�AFx��g�AGD��1AH�SiJ�AH�$�VAI�]+��AJ�݂'��AK~�m�I;ALc�E�	O        ?�4H%)h�@��Γ�g@!���ߊu@2�Ȩd�i@@.����@I	ֻ~�:@Q�T��@Xe�t�&@_��g�@d=�z( @it�C,�@nv����@r4W����@ut�I
0@x�\
uuh@|΁���@�t�p��@�����\;@� �މ��@���@�h�@�+7i���@�����%
@��*x��@��K�?
�@�AM@���@��p,�\@��w%��@�ܔ�Ω�@��F�Tu@���1��@�_��`@��J��5�@�d+�p@�iF���@��LC�ǋ@�)��#��@��n��@�$��dy�@������I@�^o�
�@�x��>@�ؘ���i@���S�9@��][�֙@���O�@�@��k����@��Q�@��ݐȡ?@�e
��}@�'?\բ�@�V�ct�i@��-:�b�@�ӳjǽ@�!bهT'@�y&���@��ȐHGs@����;�@�]7�~@����=@������@æUG]/�@�q�0��@�A�E'        ?�zYv�%�?��%(6+?��k�)$�@Q�m�@"�u��4�@1�H0���@?U?.P@I�х	"@T���y	�@_�H,qR�@g="�Lh7@p���ΜC@v���V@~�7",�@�lRvj@�|���[@��[OY�@�6%���@�IOS���@�Ek�@����=�&@�i�ɼ@��z_�`@�v�����@�R��6�@����1�9@�&[�+"@�.�};��@�V�y�K�@�֍4<�@ƛ�L!`@ɬ�:���@���@@�eH����@�rV8ݥA@Բkh�@�)!��j�@��,°x@��U��C�@��u�<��@ḷ���@����@�2'Z?l@���-���@�*/|�i@�>�r�=@�c���v@�#P��P@��j�@�N����@�	�x��,@��LX,�u@�̇3��@���SD�@��5�5�A ��F�AEȄ�8A~�DU�A�[� �A=��Z<Az��L£A�&��bA	e�:�        ?�_��\�'@�O5 @<p�	s�@Pq�Wɸ@^@���oW@hj�oR@r/h��D @y�:����@�������@�e+��@����z@���
���@����mw�@�W��^��@�s>ã�j@��Dn@��mG��@����~q@�Y�Hǥ@��!���@���D�J@�N����Y@�.��kN�@�h
I/@� `p���@��3B��@ѳD���@�FWڝ�@����@٦J[��@��P��@���e@��Q4�/@��Sl$@�@�ע��r@���<@�U�`�4@�ǌW���@�\TJ�@�
Y����@�x����@���0��@���:t�@�5�&]l@���T
3�@��\�a�@��&���@��ӽϥbA [ �Ap3H�^A�a���A��!��A�>���9AE��JA�æKҦA	�*���A
~Q<�*Aq��q A�ތ8�AN^ɶA�p��NAnU�XA_�u�9        @��lZ�}@��% 媃@ҝ��A߻@��<�#-H@��L\@�Y�l�A0P���A�R�4A��]��+AEÍ�A�����A"2�˾A%��o��A)ȣZ�
}A."���p.A1o�B2A4 ����|A6ƴ���cA9���)�A<�ci��A@6�����ABi���AD	=�ȽAF%Ƶ���AHg 	��KAJ�FռvnAMae �rAP��CAQ�(]�UAS��T�AT���U�'AV�(^u�AX_V��WAZW��K�A\l�Y�0A^��7�/�A`wHg��Aa�AU�p�Ab�_�k�AdI���Ae�zDT�AAg"ǘ��>Ah����Aj:���.Ak��~��|Am�ic�dfAoXS��ޚAp��mD&EAq�-\�-�Ar����As��I�dAt�0���Au���qܐAv��u�cAw�����Ay+��;�Azh���ZA{�0~���A|����A~Y鉕D�A�%3���A��+Ь4A�R?�{K'        ?�oL'�'?��Ȅ{�H@���&�@)��]��@6Ź��w@A��L>]@Igf��W�@Q:z
���@VoM�]Q8@\SYk��C@atAK�(�@eiMh(@i�^��@mo�D���@q����/@s���ǧV@vD���@y/���;@|�A`��@F�2{�@�KcM� @��`��@��-픤�@���t���@���ĳN�@��ww��@��G��к@������@��Ҁ��m@���,t7:@����QR@�S��G�@��p����@��D^?R@�c�����@���9M>�@�T>�X@����^��@�v����n@���:��@��.�B�@�Ǻ�Y\y@���\Yv\@����@��Z��t�@����}`9@�����@�����|@��,̈�@�ڗ<]`�@����1@�+��x��@�_E,4@��.ƀ�@��9��@��{�ۏ�@�5�
7�@��,�9�@����=;@�4s�2�+@����W��@���c�)�@�J���{�        ?����چ?�����'@	L���9@w���@+�~�QF�@6���Wf;@Ar$�fi�@Id2VF�n@Q�IYf&@W�.aF�@_�L��@dn���9 @j�QT�@pZ���=I@tWe�jN@y��=�@~�0F[��@�����z@�;��S6�@�{��	�G@�NL�Z�S@�^��V��@�i�r�ؑ@���@o@���|�e1@�\-�*	!@��#-n�@�&f:�@��b6L@���*�>@�*�r�e@�ĥd>K�@��r�@���r8/@�Ĵ"2k�@���'��@�w���<@�	�E9/3@�a=A̶w@�Ѷ���@�V�P_�@���B?Yn@ƠZ,j�l@�e�SЄ�@�@ăȨ�@�2@Ӓ��@�:]S#x�@�,�"_7A@�H��}_@�oG�g0@Ӣ�6<,�@��d�Lj4@�.���<�@׈�4Sj@���]ձ^@�cjtA�6@��uN�@�xW��;�@�}{��@�e&���@�E���D@�.L�4g�@�{R�'�        ?��f�oӒ?�.e�M�@��=ɞ@'g	`��@6
�?؊@BU]�Kر@LB�{!�u@T��h�@]Y���b�@d@��7Y@k[���>�@r%?�|��@w��x�
�@~g���@�?�O�3@�����@��@1ɞ�@�<tm�?@����@�2��[D�@�y���@�F��f�@�V�2��@����7��@��̺g@�P�^��@��7�h�z@�	����@���=�>F@��b�i|�@��\y
�@��<��{@�W� a�@�E�>A8�@�V�~�D�@ȋ�[�@��Zv�@�i�A��.@�T|O*�@�w���S@���GXJz@ԗ�hu^@�L�g�̥@�팈(�@���/�o@�`!tK%@�8AS�X@�?5�!~�@�rt2�
@�Vg���@�N�Z�~@�qʞ?@��7�� @�u֒(R@���A�@��d��%@��4e�>@�`s�~�@�V��d@��U��E@��v��5@�ǈ�r}8@���a�~        @{�e2�Y3@��^��&�@��
���C@ݘ���@���tb1@�	υ,D�@�}`����A&��Q{�A�1��YA��8�A�K���xA���OzA�G����AR<M!�^A"�[E�A$�Xry�QA'W���DA*9c��A-B�O���A09p6b7qA1�Wמ�vA3���G�QA5q��A�7A7TQ>��YA9Iv���A;Q��i� A=l�U���A?�$�r�A@��y��AB�k�u$ACQ���aAD�l��GAE���AG6OKj��AH����AJlⶂ�AK��(���AMN��1AN�C�?��APpd��AP��{ȮAQ�o���AR���AS�ʁF��AT��r|ξAU�N�λAV�v_�\AW�����^AX��Va�AY�����AZ��쀷A[߀�eA]���g�A^,���m�A_ZE?.qA`F�A@�A`��γ��Aa}�!��Ab"`�FAb�;�0�-Ac]�ɬ)-Ad ��ĉ�Ad�B��D        ?�m�b��?����D_@��@�@�S� @%)�V�ɿ@0��v��2@8��� "�@@ߜ���@F/W-�@LH8��T@Q�DW��@U�sXh�@Z �
��i@_*W"@bMxP��5@eh����@h�0��K@l�Ɵ��p@pL�B���@r|Ͷ/�l@t�}�@wg��M@z'��ruf@}a����@�"X��@��o�)Ù@����
@��#��=@��n�E�@��g���*@�ߓ4\&�@�9C�$@�XJ���[@���_�u�@��f�o+:@�eb�o�m@��7�Q�b@�gUW/�l@�+s�@��Bi0�7@�in#�}�@�9��U��@�y���q@�Ӳ,��@�Zŧe�@�)DN_�@�H�����@�sȻz�@���w�U@��S��M6@�>uMQ�`@��z����@��F�2@@�|��Jk�@�!�2;�@�Ipk��J@�Vʠ�@��E.�S@���W�G�@��n��@��(N�@��CRQ�g@���^ֆ�        ?}�]��?��2U|?��怎�?� _p[�@�s�F�@Dx���@#3P���@0bli�@:��<�n�@D� 8��@Oy�p���@V��p@`4�om��@fH�(@m�F2�@s����T@y8<H��$@�����@�����-1@�P̰ �3@�s${'��@��n��"�@��ZN�q�@���8Լ�@�����@�~)AD�@���*�@����/`f@�~+��V@����Q�|@�����@�h����w@�l��N�@�����@��j��R�@�w����@�,I�Ώ@�	.�㥂@��ЯJP@�=@��p�@� ��i.z@��{��@�ߌ�B)@��F���@�;>yđ�@Ϛx\�@��?��@�`HB�`F@�ġ�Ѕ�@�;r�颧@��,�Ytu@�bD.S��@�5��G@�؂�:�@ݲ�WG�f@ߢZ��*�@��Գ�)@��5Ol�_@���w�@�"���@�T�4�B@��?D@����        ?�H^�D{?�XR��S@%� �~@0�s�N�@>�C�
��@Ho�r�U�@Qv����@W�`t�s@^ɑ�s�@c�V)B�@i<�	H67@p��E�Q@tNF�R�w@y��h$,e@�sc��@����@��F[oJ@�y����@���]
w�@�@�hyN*@�}}�V��@�>p!�j`@�D���0�@�2<���@�j���x@��˞�b@�Β�*}@��J/�@�K��!ޚ@��;�ó�@�{b�5@�h�A[%@��(�>�c@����� @�Z�&f�Z@�Z�bT�@ǀ�R�C@�ѡA ��@�NS�s�T@��=�ݎ@��;��%h@�q �@���}(C@�ͭO��@ץM��5	@ٙ��Ω@۫/�?VW@��BtD@���Zh�@�L@��\@Ⓝ/��@��Jga!@�T�0��@�����@�[Mh�E�@����d�Y@�n��=@�m�3E�@�C_*� @���yl�@�X�h��@�4�*�@�|홝�        @mi��^@�o�;�*�@����z-@�`��*Q@�%~����@�ݪ���@��4�@�pBl���A�:�m�AT��7y�A0G�O�A���3A�x��A����`�A�<C�A9�ٌ^/A s4 V�kA"gD1�A$zQ�˕�A&�ڍ���A)2�6�A+z�/9|A.�"r��A0g�fEA1�sĦ�tA3R8����A4�kӗm�A68>r�A8.�=JiA9�S���A;�3p�8A=��D�C�A?��F�>RA@�7��z�AA粀��YACŶ�l�AD(�_��AEZ��)1�AF����SAG�[���AI;X�U9AJ�4�`�AL{��AM��kR/{AO+8��APfpߍ(�AQ?sxkAR�f3�AS�<��hAS�"�=��AT�W}>AU�5���AV��Ń�AX	/��	*AY!��xC�AZB�H��A[m���0A\� �͒A]���f�A_,ٴ��|A`C��BA`��
n�:Aa��B��\        ?� ���}@�k<�@'���>@9�	�
c�@F�&6^y~@Qt��`�k@X�p�ԝT@`��?
��@e�~����@kK�����@p���L�@tq&��@w���e��@{���0E�@�=�Gi
@�Tt��	@�v$�S��@�򔁰fX@��7���@�N�@���@�.J}V�,@�i���N@��D���P@�I�}��@���Sx2_@��^L�a�@��C@�sU�{�j@�d����8@�df�P�@����)@���u� @��qHK}�@��u$s@�wQ�
�@�5QzF��@�]�P��@��c0[�@����=�3@�� Ѵ@�%�8*�R@�`�l��@������@�ޣ*䰥@������A@�5��7	k@��}&)��@��_M�)7@�0�Vn��@���Z֯'@��ɐ��p@�C�k�@��1�>�:@����*@�p'��Y/@�/ZC��@��;����@���ܭӪ@�|��GBs@�FG/nk�@�j�4"@��2J�@����        ?�6�{V�?٬�}0��?�_�h�!@���n�@��VDB@,�V� �@8�J*iZE@D��Θ@OW�:��4@W����O@aR�β��@h��E
@q0	1�@w��Il�@~��M�#@�Ѵ&�@�M��>��@��L���@��!��=k@�!1W���@�,r��@�p��Iѯ@��NR<�@�0�%��&@�#��@�0��|5@��y����@��V�[@��A�s�@��/:!�@������@��C�<T@�S�.2�@�;�H��@�D���c@�p9�gP@��Sj��@�6����m@���6!@�N7�0<@�Ǌ�*ڡ@�W1"�@�� �c`�@׼�W�@ٔ�3���@ۆ��<;�@ݓ[�^��@߼K.�Y�@�:�Q*@�3�y�\�@�u����R@��AIS��@�, s6�@硉X�x�@�)}�Z�@��zc���@�s��@�5��:	@�̻�R@��Pb�A@����s-@�nDVd%@�#��        ?귿��N@G�3��E@4���H{@FI�`4e@S�J�@��@^�n����@f7���DP@n(�eCW@s���c�@x��΄�R@~�D6�J�@����)'�@�qc�2��@��x����@�-��M@�"}���@��5q��@�ׁ�@�wL��@�4P|��e@��Ơ�%s@���tJE�@�G��'��@�䦾�3@��)��A:@����-@��K@<V@���[a�@���ѡgg@��.�Y<�@��w�Ez@�1�p0@��<�'�]@��`�t@�yd=�@��^���@Ą2�=8�@�-�r��;@��Z�rz@��:��Y@�ɷ4�Z�@����rL�@�Ү?�@�95��̒@�w哈�@��~|�@�+��� �@֤`��B@�3YIiOH@��ȉ���@ۙ	r���@�rv��?/@�gl�I@༥��:�@���s��@����6)@�5f��A�@�l���y@�۔X��Q@�J�y��@��'ei��@�c�}��8@�g�m�        @��˙���@�B?@�U���@� (ۇ@��"�G��A ��/��AJ�w��A�X�]��A���+�A!c�]�c~A%2��gA)r�w:A-n�1���A1Ǧ�mA3tw��q�A6�|w�,A8��Z�V3A;��S��EA>�=�1��A@� ���ABz<Mg�AD)e�$�IAE�TO���AG�ϸZ�AI��f���AK��GW�#AM}X��h�AO��~+7APЪ�{#�AQ俶�-�AS R��GAT#}9�7AUN>	��AV�d����AW���/%AX�)c}>AZ>����uA[����uA\�,ֆ�LA^-?��J�A_�a(�_�A`p�"x�#Aa v�&�Aa�"ĴCAb��)"W#Ac;�:wXAc�w+w�Ad�P0b|�Aem�c�EAf/�p�j�Af�H.�Ag���eAh���+�Ai_�
# Aj6�fW��AkC�HgAk�T���Al���]a�Am��p�An����Q�Ao�w,���ApN�`꥝Ap�5��y        ?��� ��h@ �S��@9�~ p�@J���L@V��M�j@`�F^�s�@g� �>̔@n�?+/@sr�{	�@w�_�M�^@|��8�@�� &�@�s!���@�?�>�~C@�.@k��@�<e'f{�@�g��Gv�@�WG-�@��Ղ'L@�Ă"��@��n�?��@�eϷ|x@�KT:�T�@�?���Ab@�C��O��@�+ĳ�^m@�>&�֮�@�Y7�!M�@�}AN4B�@������@��.�[`�@�$�0W%@�t�r�G@��K���	@�=�kA�@��{��[W@�G���X]@��:�f�@��I���@��n,:��@����I�I@��rR��@�����P@��I��@���=4�)@�����֨@�מ��@���ˌ�@�>A�g�&@��ސ��@��.���@�,�8��|@�J;0f�@�*�S�@��޼	Fi@�9{\�@�SN�@�!�*8ʲ@����k�[@��w �V@ƥԂ�O�@ǃ����@�d�	Tx�        ?��/k��`?����{@�-�\�@':J�b%@9x�ԐI@I)�8�o@W瞚�@c��8CX�@pj���o:@y�E��@�!X�˓�@�V�ԁ�@���jH@������@�� R@�A�#o�@����O"@�	��ۥ,@��a�[@���G��c@�B�_��g@����8�@��*�S�@�7�}��@ıM�i�@�q\����@��< �@���7�uw@��q9�@���Z�,@�"��@ט���:�@�Dv/�No@�(�1���@�#��)ů@��Lյ>�@��L*QZ@��O1#�@磑'D4@�ِ ��@�3*o�e@�1��U@�H�6&@��3*\H@�v�[���@���>��@�|��n�	@�����@���C�O�@�N��D��@���'�� @��]+|$�A )؍�LA�˰�A�h-�3&A�&�^�A�+��hA��E�,Af:v��AP%���A>H�D-�A1/�	�A	(�>�	�        ?���`ã@ؓ���>@2R�/I�@Cݙi@Q�KOd�@\D�w���@e�*��^@nU
\��@u>C&G�y@}<>E�R@�Χݤa@�l�|ƴ@�X��=��@�gܐ��@�{:-4��@��N�O@��`!�@���A��@��D�di@��RIY@�a���"@�c�I��@����o�V@�$9�ʠ@�yx��v@�� Z���@ȸ
bq��@˧q�tǞ@��J0�7@�v�G\{@���ҳ�@���`L@�	�����@�P�S�@ۿRwޗ#@�X�{̯*@��|�IM@����yu@㖓z!y�@�>l۝��@���f�v=@��v]ǆ@���q�o@����u��@�&��x@��~�2�@��4n<��@�N@�:@��F��^@�$P�6�@��DWC��@�A����@��D	���@���z�d@�rh9���A (t]��A�R�|A��Y	A(�a*EA9�,2�AS)b���At��2m�A��9�n�        @�,���� @��b%k@��:���A�֎�A��ϱ��A"������A)LWp���A0L����A4E��CMUA8��&,�^A=-�&���AAvF40AC�2IQAFnu����AIV�c㓉ALb���(AO��M��wAQs96`�HAS.����NAT�GG�AV�C�KAXǮȶ��AZƒ���CA\�b*!��A^������A`�9����Aa���5�Ab�"�ʮ�Ad
�_��AeG.t;
�Af��o�Ag�HG�ڀAiEȚ��&Aj��wRAl9�Βm�Am�j��|Aor���Ap�0�^Aqy����Arf��6�yAs\��VT�AtZ"CzxAu_P�9�Avk��QAw �n/Ax�翔�Ay��5��Az��cTA|8�.�ZA}E�ۚCA~�i���A�/6i�A����˼>A�1^�TA�ݐA�Y�A���
c�A�?�	��A��
�B�A���W`
�A�h�`��.A�&�
��A��%%�A���0��        ?�U�:s?�S����@
v�D�=@�y 2��@-z�����@7��'^^@A�ܧnN�@H�w�s�R@P�r�ꗫ@U�y�a�'@[b=z�i�@`�gMZ@d�eU��@h�aCL�`@mS^�@q1+���_@s�����)@wj��tV@zZqO��@}��p�@��/I�E-@�	�%鑓@�G��(E�@��R�o�I@�-���s�@����3�@��%�d;�@�CX��@���`��@�b�`��+@���Q[@�˹�W��@��I�m*�@����cx@�}f��@���N3s8@���Nֲ�@����j�@��4��(@�M�BM�@������@��a�Ҟ@��XNT@�t}E%�m@��X
0�`@�D��d�B@����3g�@�?��� @�f����@�3	��oG@����_@��4?�k@���ڒ~g@��T]h9@�}GYO�S@�h�K�>@�Z'���@�Q� �;�@�PK��v@�U��J@�bp�ܞ@�u^p�)|@�����2        ?�:q�H\?��Ї�۵@S�Η�@(Y�t�w�@9Csv
Qg@F��.Iz@R��+�x@]��\J�@f!���l@o��WY�@u��i��%@}>\>��,@����l@�,\)�{p@��.�(@�s��#�@�L��l/�@��=M���@����o��@���$i%@���Rf�@����ý@�ϗ��C�@�����%
@�����:@�ar�A�?@�+Dͷ�W@�5�>�b�@�������@�K�O�@��	Jz@�	���@�S#(�?@ɾm��7�@�WaӰ�@��g�@�d�;tT@ң"I(R@�TٷC��@�"�Pڥ�@�̘b8@��52,c@�Afi[�&@ތ��05g@�}�%	p�@��_��@�%ͻD�@�.R�'@� 1��p@��,�%�@�uR��@�D���'@�-�t}@�2���@�Wb�#�@��db��{@����͍r@�5H�1��@��[*��A@���H�@�V�t$g!@����$/@�q�Ԭ�N        ?�=�WOò?��Y�Q]?���}J@�1i�Q'@"W��&O�@0q��@<�t�ֶ@G�w��@R 6�k�@[O��� @c��m��@kʂ�Q�h@r�^��&@y �N�]K@�R�`���@��z��[@�w��L@��8�~�@���Q�]�@�|� �@��(� �@�ZT��@���S@��2U�v@���+@�i�'�d�@�`���@����Q`�@����˭@�R�;)�@��7��3@�W� /�@�#u��=�@��%?^�A@�.���`F@���f�d@���u6@Ǹ��@��|�j@�icҾW@�_<����@�k�	H_@Ѹ�wm�\@����t@ԄK�@��L@ב?��z@�/�
Ց@�ݘu }*@ܚ(mt�{@�d����@��^�$@�x�B�@�
�fk	@�
��!�@��u��d@��n�y�@�1�Ҧ�p@�L��7`F@�n���P�@阝^��B@��VE�O�@�9+��r        @k�����@�_�*�@�<��N\�@ѝeMo@�	�˳�@�\�J�@�e.#e_@�4`��?fA �g;;ZA0����lA
qӭ�g^A1J��VdA�R6�J�A8��K@EAO%��A�5+���A"Ya�z�yA%0?�4mA'�p�PJ�A*�b �0A.:��JA0��G;QuA2� �@*A4���NC�A6���l�!A8��s��tA;	�?y:<A=ce���A?���㗫AA7Gv&AB�e��AC��j:�7AEtq�E�7AF��O�AH��>�A-AJDs�ϧAK��#�U/AM�)��AO�J�)��AP˘���AQ�����AR���=��AS�QC�AT����?=AVUo�ԎAWH|D��AAX{�r�AY�4�҂�AZ�����A\E�b�HA]��kM��A^���#<A`-M�H�aA`���l�SAa��F��Ab^�bk(�Ac#�%��Ac�c\�".Ad��K�Ae��� �'Afl�����AgM��7�Ah4Ƒ�M�        ?�'/��@�M}Ǹ@"�i�d:@5�T� a�@C�9�{�@O�u b�@W���(@_���`��@e����@k ��\�@p������@t��r{
@yY�XyT�@~a����@� a���@����@��)F�^@�11�18@�'x�	@�/	>�@�i���U@�����@�0̼}�4@���ݷ�@�P�-�@�~װ���@������@�D��9��@��*�y��@�%��.=@���Z��+@���Wj�@��y*��J@��#���@��p0ݳ0@�*�K�C�@�X�|��M@�!��@�ߚw�K@��0�B�@�g7�ġ@�,5�78�@�����@��bt�A@��41�?�@�P�iR@�;(��@�����L@��J9/�@��MV�@�b����9@�7�/�eG@�e{Y}4@��(�ch@��~��Z@��|D��@�<蜎��@���F���@�%�ߪ"e@���z �>@��-gn@j���@�!��TR        ?�:LH��@#Nt�Y��@B���H@U�+�(��@c�q��@n�[�S6@uߎ���@}B�a�|@��-��/�@���R�@���LbP@�-�T>1@�2�@���#a�V@�N�#ߴ�@����!��@��+���@��X�@��-^�9�@�m𧡶@��!���g@�M����d@�U�"�W$@�e?�oCi@�ؤJT�@Ɔ�����@�q����`@̚�&�T@����@����>�@�Λ
?e�@����W@�)ï�9y@ڐv��ܣ@�D˅� @�׈�9s@�]=}%�@�䖠�I�@�E�7$�@�6�VY��@�[b+�@�����@���m @��#~A�d@���8}@�/h�Aid@�]yF��4@�CӛP#@��!c@�5?Ź�<@��!��@�	 -��@��'�0ܪ@��t�ސ@���Yq�@�\� v�A ��\XAoUX5��A[_E��ANF�bfAH��>AJ�꿾NAT&÷}�        ?�����@�4��d@2�ܣ)@D�u�k$@R�L�'M�@]>�N��@eymx>�g@n��F��@t]#U@z�p�:�@���S ��@�������@�ɔl2��@� ?B��@����CC@���}/1@���X��G@�j����r@�Y����@�����@��`_�+@��ހ.d@���A!@�dqE�m@�kt��@�|����@��vŖ@��@��@�&R�E̿@ͷd��@���њ��@��R!Im@�G����@�Ųέ��@�o�����@�D�8L�w@�!�c��M@�bo7|@�^�@h�@�|K�3�@��13��@��dd~�A@�4���@�B��@��J򰣜@�t`IX �@�ƨ=s@�v�J�@�����@���B�V@�6}\�C�@�u�w2�<@��x|�a�@�f}yF�@�l>s��@�ҋ�L��@�C�&�!@���w�(A �<���Ap���AC)���A��A�.�^ X        @��_��C@�u���@��H(J��@�����A
�d��ȐA����F�A_�,*�A#�ʥ']A)�����A0[y��A4@�ym٦A8�Q��A=�Q�j��AAt�+4�ADp��/��AG�ݦ�5�AKR�t˸AO=i{@x�AQ��	�7�AT	�I�NAVv]�g�AYj�w�A[�P��rLA^�%���A`�?�q��AbSK�BвAc�|���]Ae���YAg:1�4�lAh�Cϻ�Aj�
SE8�Al|�<�s/AnJY�úApՌr�Ap�r���Aq�Pj��Ar�ؓ`��As���Y�At��L|TAu��/jYAvi)i2�AwPh���Ax8?|G:gAy":W�/�Az\����Az���攇A{���)A|� Ň�3A}ו׏�A~�M�CnA��h��)A�fYW���A���^�A�h�2�tA�����A�s�*.��A���uMhjA���L��)A�����A��=���*A�Q����A��b�ŞA��5�r�4        ?����G�?�j�^?�?�2���j@\w{���@��hkDN@l���B@&ƂP@/-U����@4u�䂈@9���n�s@@3YX��@C�6r��@GV�n1[=@K{��xlX@O����@Rn��)@Um:A�@W�=�]@Z���Q@^<��Y1j@`� ![��@b�*�Ѐ@d����@g	ofO@if�*5^@k�����@n�y�G	$@p�	�V��@rS��DW3@s���6@u�7�Ћ@w������@ys6'`�@{uq��@}�����@��Ŷ�z@�Y��Y�@�/�Px�@�iϚ��8@�����@��A�S@�`z+��{@���ӝ@�Dy�0*@��C����@�]H���@����)@�U�,h(@�3�Ji�y@���H�"@��O�@���eײ@��Jt &�@��7�`�:@�ſU8�@�$�T��@�C��Y<8@�l~dK��@��<gz��@�խ.�vr@�%�PJ@�Z� ��b@�SB����        ?�sNb��?�/�]G��?�'�)+/?��f�v�@�F�Q@����G@"���@p@/J�.�}�@8�l��
�@C8�w�)@L����@T�]�D�:@]9fr7q�@d$[rJ@k0�c��y@rK��W@wvk�s�@~1�H@�|-��p@���2:y@�.¤��@�ŴP۟�@�nKi�_�@��B�R��@�[�j��@�ܔX��[@��h��߂@�C���2�@���@��	=@�uP�o)�@�
#��t@��pֻT@���u�	@�t��n@���[��@�&ۼO	~@�`I��'�@����x��@�b/[�L�@�-FL/HX@�r_�ժ@ѭ�/1��@�_K[��t@�*W�cz@���w�@�	zYtbW@�K�O�O@�H�ĸh@ߋ�"v��@���@Nȥ@�+Y�=&@�og���@��J�+@��	ɩ	@�W.��p@��\w
s@�k��&1A@��%�G@�	��@����y�@�`��d<@�7�ܹ��        ?�'����?�O�D7J?��Щ�)?�U���W@u�rv�y@2���:�@(�I��P+@6��b�7@D 8�t�@P����@Y� g��P@c��*��X@l@��P��@s�<�{U-@z�jQ�\@��&��z@�H.��S@���w]@��Ɗ��@�:�\�S-@�{@�8��@�Ep�1��@����iF@�����m�@�$�+�=p@��x?@�۰����@��!ȼ�@�\\9�pn@�.+�+a@�����@�T,D@žßQ�r@�[d��N.@�+�
	�H@�1�dB�)@зA�#�!@�r(I�	@�J;����@�@%��E@�Tl���8@ڇj;x�@��M�,�@�J"��u@���'��@�D7R2�@��vc��@� �Wd�@�c��q@�;=h�%�@�߈�U@�Usi�C@�V��޽]@�)�h!<�@��V�J��@��O��\@�o���@�Z����@�����]$@����3�@����mc@���>���@�/�1�h�        @QkT����@��@���@���6�޻@�r: |��@��u��@ǶeuS@�G��c"@׺�5�J@�5)_�e�@��X�\^�@�9.Y�,@��n	��@��zڃ}@�;�<��@��D�v^�@���Hg�.A ~��}��A����[AW�@ �LA�qk�>A��H�A[����A��{"��A�W��\�A�|���Au�ɏ&A����`A���/A �,�K�A!��׼��A#��g3zkA%�����'A'�d�0L�A)��I��A,/�@+�A.����P�A0��\�A2 5�PIA3m<�E�A4�(� �A6wl��.A8���A9����A;�P�WA=`@�#�iA?K?�]�"A@�<���DAA�+J�nAB����eAC�_o�"�AE
��es�AF>߇� �AG~�и(AH��mAJ!7L�$+AK��F�#AL�Љ��ANk8%%H�AO��/��AP��&��AQ����ARV����AS&�oG#v        ?�K�Gp?�r����?�e<�'�@�\N��@>#�5�!@� ��T@%,���@,u[�wg�@2_1�b;h@7�� v@<5�^ũ@@����+@D`z7�2@G���E�&@KP���n@O`�w��@Q�<8V@T<	�@V0�5@Yv��q�@\Z�͏��@_pq<��@a]0�uw@cLk��T@d��'��@f���bB@i�$d��@kH�y3�@m��3@p�;�@qj�L�@r�Q��.@tR)m�C@u����@w��*�@y`�!�@{G���gF@}M,�6Q�@q} x��@�ڇ��3@�I�wC@�MV�1�@���J��h@� fH��|@�r��:�@��d��s�@������i@�3�%�,�@����@��#2���@��V���@�ΚKe��@��D��'@���@�{���@�9���I@�tUZU=:@������@��[�@�sA�o@���!�@�`?�+Z�@��XQ.F%        ?�.ᩆF?�����??�kX�$�?� nq@��:�J@k᫾]�@I{�ҏ@'hkj�@2�5��t�@<���K�@E��Ib�@O�O���@VT�B�x�@^��^y��@d���G{@krd��{�@q��e��@v��d�F@|���l@��ޖm@��?X_�@�����k@���XyG@�AѰЊ@�|�}���@�\{���@���Uv+@@���um�c@�[�Y���@�?�@��@�ht��@�����@���u��@��DF��@��I�ѧ@�b�f�B@��P�T?@���qT�@���8%LU@�`ڥ�C@�����@��r|A�@��l��r@�Ǵe��C@���_,@�2E>�u@ϗ��@�Bu��@�cM��s@��O��]@�>�e�YM@���B��@�_W�)��@�
y^1�^@���#%�@ݗm]_��@�y��A��@�-(��@Ỵ? %g@�ɥ�Ϩ@��~��@�i�c�@�/����        ?{�ȩ��e?��UmK.?�1��1�9?�O�Q#?���N�?@��� @�m�g�}@#����أ@0-u���&@9x�s���@CK�C�r@LD��2χ@T���@[�!;
@b���Β@iMBQ�d@p�cz�u�@uQ�V��@{
P�Ah@���y�߾@�����i@��B;>{P@��ķ_[�@�{aA��"@��4t�@����S�%@�(}��H�@�~+V�ư@�)��e�_@��o�O@�RLQ`-@���*@��2,�K�@��Zu�O@�-}��{/@���.wT@�BQ>��@�����@�����@���SwH@�wrcA�@�V��5�3@�V����@�w�83�@˻�D�B@�$2S�J@�Y1��6@ѳ�NK��@�"����@Ԧ�n�z[@�@i��5=@���1@ٶ����@۔d�H��@݊j�k-@ߙ4 >9@��w�@�t?�7@@�//�}��@�i�<0@屓��@�O1y��@�h Ǝ�        @I��^;r@{ DԺ��@��D{��@�ܕU��h@��8��@�?���@�V�Jc��@ѣ�C̶@֪Zw��@�C0��
@�9���մ@䡹((��@�_���\@�w/���@�w�r��@��hA�v@���r�@�b]��z)@�s���X�@���ھ�WA"y��O�AD����A��=�A'�*U�A	k��a��AҤ�9�A^`���mA�J��
A�����Aw�����A��2�A����A�N a�Ag��b�Acӛy��A~<݃��A [��=�A!���(��A"��W'A$xW��A%q	�uROA&޸�S��A(\���;�A)��FH�$A+��î�_A-9���̪A.���R�A0g��ȟA1Z-�5A2V��֩A3]j���A4n���f�A5����<A6��u&.A7�0�)A9#/�A:m��N�WA;��`/l@A=%����A>��Hu{A@��ȩeA@ɱ�`�[AA����>?